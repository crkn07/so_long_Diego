/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   read_map.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: drubio-m <drubio-m@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/03 17:10:25 by drubio-m          #+#    #+#             */
/*   Updated: 2023/03/08 16:32:02 by drubio-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/so_long.h"


void ft_check_args(int argc, char *argv, t_map *map)
{
	int len;

	if (argc != 2)
	{
		ft_error("Error, solo puedes pasar un argumento");
		return ;
	}
	else
	{
		len = ft_strlen(argv);
		if (ft_strncmp(argv + (len - 4), ".ber", 4))
		{
			ft_error("Extensión del archivo no valida, prueba con un archivo '.ber");
			return ;
		}
	}
}