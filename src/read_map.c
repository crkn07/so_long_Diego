/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   read_map.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: drubio-m <drubio-m@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/16 17:53:18 by drubio-m          #+#    #+#             */
/*   Updated: 2023/02/28 18:21:08 by drubio-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/so_long.h"


void ft_check_args(int argc, char *argv[], t_map *map)
{
	int len;

	if (argc != 2)
	{
		ft_printf("%s", "Error, solo puedes pasar un argumento");
		return 0;
	}
	else
	{
		len = ft_strlen(argv[1]);
		if (ft_strncmp(argv[1] + (len -4), ".ber", 4))
		{
			ft_printf("%s", "Extensión del archivo no valida, prueba con un archivo '.ber");
			return 0;
		}
	}
}