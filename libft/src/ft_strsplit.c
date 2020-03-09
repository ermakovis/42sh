/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strsplit.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcase <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/01 16:41:42 by tcase             #+#    #+#             */
/*   Updated: 2019/07/28 14:28:21 by tcase            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	nbwords(char const *s, char c)
{
	int		i;
	int		nb;

	i = 0;
	nb = 0;
	while (s[i])
	{
		while (s[i] == c)
			++i;
		if (s[i])
			++nb;
		while (s[i] && s[i] != c)
			++i;
	}
	return (nb);
}

char		**ft_strsplit(char const *s, char c)
{
	char	**tab;
	int		i;
	int		j;
	int		k;

	if (!s | !*s)
		return (NULL);
	if (!(tab = (char **)ft_memalloc(sizeof(char *) * (nbwords(s, c) + 1))))
		ut_cleanup(EXIT_FAILURE, "Malloc failed at ft_strsplit");
	j = 0;
	k = 0;
	while (s[k])
	{
		while (s[k] == c)
			++k;
		i = k;
		while (s[k] && s[k] != c)
			++k;
		if (k > i)
		{
			tab[j] = ft_strndup(s + i, k - i);
			++j;
		}
	}
	return (tab);
}
