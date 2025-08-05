Return-Path: <ksummit+bounces-2046-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7534B1B907
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67A06720133
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B66291C17;
	Tue,  5 Aug 2025 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLha/VLe"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F53FE5F
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754413895; cv=none; b=eEF+QQ9i48LWg10shBG95fS7ShpBzUhJUwnz7z0Oj3wPL9UFWmG6pYgaIRGHYo7Qe85xio9LfHctbKJ34jDtF4HCbVm0BF78esQ4p61cDsOAAhFWi6FXOCPzEOOlZ8clSc20HONrfhcRd/m8c3yz61QCNlv6UJTisI1reWLcu8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754413895; c=relaxed/simple;
	bh=ohq6FFzDpPxOSRs5EdIg5aW9k/DXGpMQ3L8uZ5Q4nc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRnKJPlegYZA/JOdRybLUUoA/9DwI37NjNyCddrsLjLfTYXd+fKVyGVj0ZAEg7NPaVhQEOpQM5lKEQ8MrTU2qOo5oW+dywK/x+nEsL8FIUoGKYp3iuWN4z3KmVUXj5Zvkqdv80KiyeL3gzthfBGzTYMdgrllPyRzfeODUpvjomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLha/VLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F32C4CEF0;
	Tue,  5 Aug 2025 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754413895;
	bh=ohq6FFzDpPxOSRs5EdIg5aW9k/DXGpMQ3L8uZ5Q4nc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLha/VLe7yfInlLnSeFyf6isqf7sMfjaTTtilGlcg5Tyks2jKaduxlKRKh5ujQVYf
	 CIC3mj+gUk3DDkog9HjewLUz28uFFqbBsRpbHA1qHZaRtnnBD+FvYlznNn4y2h3PRz
	 Zu1ziL39GODXOuuqI9+QRPmnMeKsd+mgDsw3e4vT7wywI0b6bGFXxNEOej/0rD4wKD
	 Jy2jDYcdu2Vy61RAW9/Q+iLerMRSg6KImaaJ+sJTp3ZRAlCB1/Bg/Y95CR5wVNwO2R
	 G4KkbuMfHfd601G2WlVWHHIbADUuQgn2li45AkoHXdCWZpsnvKsd2mUDssUQmbkOuq
	 EAVyZk7exaGpA==
Date: Tue, 5 Aug 2025 18:11:31 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqAUdGE7DAGOGalR"
Content-Disposition: inline
In-Reply-To: <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
X-Cookie: Trap full -- please empty.


--AqAUdGE7DAGOGalR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
> On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:

> > * On the other hand, there are use cases which are useful - test
> > data/code generation, summarisation, smart auto-complete - so it'd
> > perhaps be foolish to entirely dismiss AI.

> Patch backporting is another such nice use.

Patch backporting sounds pretty scary to me, it's the sort of thing
where extra context that needs to be accounted for is very likely to
come up (eg, assumptions you can make about existing state or
santisation).  That trips up humans often enough and doesn't seem like
it's playing to the strengths advertised for LLMs.

TBH I'm not thrilled about the general test code is trivial assumption
either, unstable test code or test code that doesn't cover what people
think it covers are both problems.  The issues when things go wrong are
less severe than the kernel itself but things still need to be
maintained and we already have issues with people being dismissive of
the selftests.

--AqAUdGE7DAGOGalR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiSO0IACgkQJNaLcl1U
h9DFQwf9H/jc4/6BbqMvx9CwrUkGT2qJO3L4MxfLWE7baxEjEScfvJMjgPfLmy7z
75+Sv4jg509RvZssfDS87wItv8GqcjuxEztGDoeLbqD1CN93hpdcunic+Esdojc2
emCDGUr/AJMUc2CLsPAbvqbvXgUWik4rg5vKD/LlGmDbpUeODwNFms7t4+g3hxz1
Ih27aYv7xmX+ACV2ptJpb9dCxs8GsbNiT/hvqeVR4p7xTcjXPppeBRiCbXI6mWqF
pHFGbYlcH0FfKTaM68/FMiUobvytllNLiG30jwPSYi2mIhnp7f4j8TSIWheod0sA
xSIeDsk+MgTmYrBkGiJWOeQzcUZxeA==
=kS3v
-----END PGP SIGNATURE-----

--AqAUdGE7DAGOGalR--

