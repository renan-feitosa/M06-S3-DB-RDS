-- Utilizando MySQL

CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `db`;

CREATE TABLE IF NOT EXISTS `Paciente` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `idade` INT NOT NULL,
    PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS `Unidade_Saude` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `endereco` VARCHAR(100) NOT NULL,
    `tipo` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS `Medico` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `especialidade` VARCHAR(50) NOT NULL,
    `id_unidade` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_unidade`) REFERENCES `Unidade_Saude`(`id`)

)

CREATE TABLE IF NOT EXISTS `Veiculo` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `modelo` VARCHAR(50) NOT NULL,
    `placa` VARCHAR(50) NOT NULL,
    `id_unidade` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_unidade`) REFERENCES `Unidade_Saude`(`id`)
)

CREATE TABLE IF NOT EXISTS `Produto` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `tipo` VARCHAR(50) NOT NULL,
    `descricao` VARCHAR(255) NOT NULL,
)

CREATE TABLE IF NOT EXISTS `Estoque` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_unidade` INT NOT NULL,
    `id_produto` INT NOT NULL,
    `quantidade` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_unidade`) REFERENCES `Unidade_Saude`(`id`),
    FOREIGN KEY (`id_produto`) REFERENCES `Produto`(`id`)
)

CREATE TABLE IF NOT EXISTS `Tratamento` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_paciente` INT NOT NULL,
    `id_medico` INT NOT NULL,
    `gravidade` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_paciente`) REFERENCES `Paciente`(`id`),
    FOREIGN KEY (`id_medico`) REFERENCES `Medico`(`id`),
)

CREATE TABLE IF NOT EXISTS `Transporte` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_paciente` INT NOT NULL,
    `id_veiculo` INT NOT NULL,
    `data` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_paciente`) REFERENCES `Paciente`(`id`),
    FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id`)
)