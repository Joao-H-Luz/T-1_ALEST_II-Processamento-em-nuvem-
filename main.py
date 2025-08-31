def execution(self, cpu, politica="menor"):
    total_time = 0
    while True:
        prontos = self.pre_execution(politica)
        if not prontos:
            break

        ativos = prontos[:cpu]
        menor_tempo = min(node.tempo_restante for node in ativos)
        total_time += menor_tempo

        for node in ativos:
            node.tempo_restante -= menor_tempo
            if node.tempo_restante == 0:
                for filho in node.filhos:
                    filho.free = True

    return total_time