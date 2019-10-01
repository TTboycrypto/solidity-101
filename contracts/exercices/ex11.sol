pragma solidity >=0.4.21 <0.6.0;


import "../exerciceTemplate.sol";
import "./ex11b.sol";
/*
Exercice 11: Finding a hidden exercice
In this exercice, you need to:
- Read the documentation of another contract to understand its structure
- Extract contract ABI
- Use the ABI to extract the contract content and find the missing contract
- Call the contract function
- Your points are credited by the contract
*/

/*
What you need to know to complete this exercice
A) What was included in the previous exercices
B) Documentation of the Kelsen framework on https://github.com/97network/Kelsen/blob/master/docs/01_standardOrgan.md

*/
contract ex11 is exerciceTemplate {

  address public ex11bAddress;
  constructor(address payable _studentsOrganAddres, address payable _teachersOrganAddress, address payable _pointsManagerContractAddress) 
  exerciceTemplate(_studentsOrganAddres, _teachersOrganAddress, _pointsManagerContractAddress) 
  public
  {}

  function setex11bAddress(address _ex11bAddress) 
  public 
  onlyTeacher
  {
   ex11bAddress = _ex11bAddress;
  }

  function askForPoints(uint _aValueToInput) 
  public 
  canWorkOnExercice 
  {
    // Instanciating the external contract
    ex11b ex11bInstance = ex11b(ex11bAddress);

    // Retrieving value from external contract
    uint retrievedSecretValue = ex11bInstance.secretValue();

    // Checking that our input value is the one stored in contract ex11b
    require(_aValueToInput == retrievedSecretValue);

    // Validating exercice
    validateExercice(msg.sender);
    creditStudent(200, msg.sender);

  }


}
