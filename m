Return-Path: <ksummit+bounces-1565-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA6976D79
	for <lists@lfdr.de>; Thu, 12 Sep 2024 17:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB5251C2379A
	for <lists@lfdr.de>; Thu, 12 Sep 2024 15:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989D31C172A;
	Thu, 12 Sep 2024 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uASnC7zs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2196E1BE23F
	for <ksummit@lists.linux.dev>; Thu, 12 Sep 2024 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726153981; cv=none; b=fvosjxSHtbZz3luvK1zHyqppmqok1S9Wl5ihSi19YNcfbWh8HGa1xmXsPwRf62Gbf5xOFE5BuZofIB5gcWQZPPGE3oOAogdFmfhJafUjTWRIreAfJy0yt1OdrS+afn3ZbJ6uHZag/QvPb57LCIrZI4AU4DknD4a05v1WipDWWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726153981; c=relaxed/simple;
	bh=WdXntE+qChCwsbq/1Gtlq/qwwq8Ntjt/4l9DcXwtcH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFdf8u7xWo5xGFA87omE3fGj8ajYzvBTiM4QNIVaj6JIP9BULOUkXGb87OHB6oClN3Fde15oFZA+tr9yYUD4snIV0R2alPILytQyZ2nF6JzsIB8f5vtdts01cmBt50ESV2wngWdomwahAHD31G7sUBxZQvpQkiiVFS44Xbxgn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uASnC7zs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B95BC4CEC6;
	Thu, 12 Sep 2024 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726153980;
	bh=WdXntE+qChCwsbq/1Gtlq/qwwq8Ntjt/4l9DcXwtcH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uASnC7zssT0k/hZD65RjYWqyQ469dZz89u7NxVtaWn10CK/z6AYgQPFuDXO0m1Xsw
	 JmsWWujxeKxF7Fh4m7QjT+a5be9B5TBjhUz9657/IyFTjJFL3WYNGsvTb/9py6vIIx
	 h+9R6gzsvfdP10kka/YCbYxm1wzZvpyr0yda1u+PY2H2zv3ezJUA2Ey9mr7uC+nImm
	 LUfhAoB3OyuceuB8sWxE6b7l9HQ635pgLF9JjtL/kbJS3dQcA75y3zCp3kj65UVEKr
	 6DPvpY/xUJLXW6yAPT2WsJncITGEaqL4iEKb2Hvo0lQNZEPlETtF45pxSf+pl4KsZR
	 HJMzlsnDpqCVA==
Date: Thu, 12 Sep 2024 16:12:56 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robherring2@gmail.com>,
	ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
Message-ID: <1847c00e-e1f3-46d9-8a10-bf9254a5f543@sirena.org.uk>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <20240910-specked-rigging-e255283d1f99@spud>
 <9d1af9dd-680a-4df8-a6c7-49a6f809d6f2@arinc9.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Axtfi4cO/VejCEyd"
Content-Disposition: inline
In-Reply-To: <9d1af9dd-680a-4df8-a6c7-49a6f809d6f2@arinc9.com>
X-Cookie: Happiness is the greatest good.


--Axtfi4cO/VejCEyd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 04:01:20PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 11/09/2024 00:53, Conor Dooley wrote:

> > What does "fixing DT source files that did not comply" have to do with
> > Linux, I'm afraid I do not understand what your point is there. The
> > bindings are the ABI, and fixing incorrect source files would happen
> > regardless of how the project is hosted?

> That's exactly what I think. I had a maintainer that argued otherwise is =
my
> point. Which is why I want to strengthen the Linux documentation.

TBH I'm not sure an issue like that would be particularly fixed with
documentation, that's more of a people thing given that the DT is ABI
thing is already widely communicated.

--Axtfi4cO/VejCEyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbjBPgACgkQJNaLcl1U
h9AhVQf9GU8djaJ+33KUQblN0iWUJBFRzS2EwWkuC5Wty2ooDOa8OiUY0gNKUVjr
TOfVlJdIjJzycFiM74/1+SegU8UDQ8D15S2iOe7c5AiKzTtaaIpR9HWjrjdgfCJs
TJUAs30nd1/8RF1pg1akE9RrBM8ugCNpx97sYRSbDkI9gOEd81L0mhUbK0lx5CM3
UYxwWesyhruaEFMi4fivCv5J0f2Zbrm/kcWYB2rVXK//npP3hOkeQiHg5QBbBHcy
TRSg782Ahd5dkub+hnfCjuiFgJj/0YO9oRSLDTtK0Dbc98yBu53DpSK6jhngIlJ+
Jg4Gj4KE/RLYxtl8HUWA93SdQUfdCg==
=mH+/
-----END PGP SIGNATURE-----

--Axtfi4cO/VejCEyd--

