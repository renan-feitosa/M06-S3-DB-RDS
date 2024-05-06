SELECT
    id_veiculo,
    COUNT(id_paciente) AS total_pacientes_transportados,
    COUNT(id_paciente) / COUNT(DISTINCT CONCAT(YEAR(data), '-', MONTH(data))) AS media_pacientes_por_mes
FROM
    Transporte
GROUP BY
    id_veiculo;
    