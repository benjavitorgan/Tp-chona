// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
 
contract estudiante {
 
    // Creo las variables que me pide
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => uint) private notas_materia;
    string[] private _nom_materias;
 
    //Creo el constructor con las variables que pide
    constructor(string memory nombre_, string memory apellido_, string memory curso_) {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
 
    //Devuelve el apellido del alumno
    function apellido() public view returns (string memory) {
        return _apellido;
    }
 
    function AppendString(string memory a, string memory b, string memory c) public pure returns (string memory) {
        return string(abi.encodePacked(a,b,c));
    }
 
 
    //Devuelve el nombre completo del alumno
    function nombre_completo() public view returns (string memory) {
        return AppendString(_apellido, " ", _nombre);
    }
 
   
    function curso() public view returns (string memory) {
        return _curso;
    }
 
   
    function set_nota_materia(uint _nota, string memory _materia) public {
        require(_docente == msg.sender, "No podes cambiar tu nota, debes ser un profesor");
        notas_materia[_materia] = _nota;
        _nom_materias.push(_materia);
    }
 
   
    function nota_materia(string memory _materia) public view returns (uint) {
        uint _nota = notas_materia[_materia];  
        return _nota;
    }
   
   
    function aprobo(string memory _materia) public view returns (bool) {
        require (notas_materia[_materia] >= 60);
        return true;    
    }
 
    function promedio() public view returns (uint) {
 
        uint _cantNotas = _nom_materias.length;
        uint _sumaPromedio;
        uint _promedio;
 
        for (uint i = 0; i < _cantNotas; i++){
            _sumaPromedio += notas_materia[_nom_materias[i]];
        }
 
        _promedio = _sumaPromedio / _cantNotas;
        return _promedio;
   
    }
}
