SELECT
    YEAR(data) AS ano,
    MONTH(data) AS mes,
    id_veiculo,
    COUNT(id_paciente) AS pacientes_transportados,
    COUNT(id_paciente) / COUNT(DISTINCT DAY(data)) AS media_pacientes_por_dia,
    COUNT(id_paciente) / COUNT(DISTINCT MONTH(data)) AS media_pacientes_por_mes
FROM
    Transporte
GROUP BY
    YEAR(data),
    MONTH(data),
    id_veiculo;
