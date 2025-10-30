<?php
// login.php
session_start();

if($_POST) {
    $email = $_POST['email'] ?? '';
    $senha = $_POST['senha'] ?? '';
    
    // Simulação de autenticação
    $usuarios = [
        'admin@clinica.com' => password_hash('123456', PASSWORD_DEFAULT),
        'medico@clinica.com' => password_hash('123456', PASSWORD_DEFAULT)
    ];
    
    if(isset($usuarios[$email]) && password_verify($senha, $usuarios[$email])) {
        $_SESSION['usuario'] = $email;
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Credenciais inválidas']);
    }
    exit;
}
?>