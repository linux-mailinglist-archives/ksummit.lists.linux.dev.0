Return-Path: <ksummit+bounces-1571-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6642978588
	for <lists@lfdr.de>; Fri, 13 Sep 2024 18:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A761C22947
	for <lists@lfdr.de>; Fri, 13 Sep 2024 16:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671E76F2E0;
	Fri, 13 Sep 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgQm87o+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C955769
	for <ksummit@lists.linux.dev>; Fri, 13 Sep 2024 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244024; cv=none; b=FDuW2tw2SPc5CI8MCutVxp69mVuIyDGOjFD1cQlOQ+DlM5/HdaHFk8a6zhdE2AB3s+jpzYXWB7puhLOZ/odwlwKqKg/itRXBxGu2PpKNxqX+lXnjZFhN2MXtVrgNqyV7m8ciLI+iJZdZT4o8YeNPgIIgl2jufITa3QGP+3A2CFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244024; c=relaxed/simple;
	bh=aj0InpSP7mo+I5OEcg9ioKwoLySwt5XB9sCuBMTesDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTQ1NffLJ0vDIAJJA92rSaTMYOZGUug6nXN69Js1fCd4virZMXJISP3eS+Hq7PvtmPh/p4yoDIFGtkwivIxX21LrC1K9hdOB4HzP8KFeATA85eCTv8JhRLYLzwb/HYS+5YpeAORvaDI739q012D/3lySNuSSzphgdNzVdtCGR/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgQm87o+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46708C4CEC0;
	Fri, 13 Sep 2024 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726244024;
	bh=aj0InpSP7mo+I5OEcg9ioKwoLySwt5XB9sCuBMTesDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgQm87o+bgVpCt54K9g/VEENGlXIg1NN5yYxe5jCBfgTx31h+a9eF6BSdIM3blM0V
	 sb++p0emsuiEXnmi67pMzHOqBOkGy0LXaDwhbnegwHsMZfbP9Q/RNVCPC4I8iFGEJ5
	 k4/j9dHk/BwRNHDw39rS02aHbeYNHHGxx85UXQmhBLEGvjCcMjryoxbh+ZpgpaQSYh
	 WTkI6EgsWWsECo9DMR5MxcB1usnQJbcIe/mB1vphRXdA9gmgwoAq/WU57IeBM2EPFI
	 p1bMK4wCCKiLM2uWCXk8Ly6sbwnKh7pwqnGuzpEqSm3miLiLzsmxiDZxUfvf3kd7CG
	 fBq3ozS4b21Eg==
Date: Fri, 13 Sep 2024 17:13:41 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Rob Herring <robherring2@gmail.com>, ksummit@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
Message-ID: <20240913-elective-barmaid-a15b56b5dab7@spud>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <32400a92-23c0-4ec3-9e42-29074e6db1f5@arinc9.com>
 <0ebbade1dd90305b4abf1315a2735f7f7caa81bd.camel@infradead.org>
 <074766B4-C125-4514-B57D-043473819A0B@arinc9.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FfrAk5Ta2Sde701h"
Content-Disposition: inline
In-Reply-To: <074766B4-C125-4514-B57D-043473819A0B@arinc9.com>


--FfrAk5Ta2Sde701h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 05:38:44PM +0200, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 13 September 2024 10:08:41 CEST, David Woodhouse <dwmw2@infradead.org>=
 wrote:
> >On Thu, 2024-09-12 at 15:57 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote
> >> Over the course of years, I've had maintainers resisting to or complet=
ely
> >> blocking my changes on the device tree definitions because of Linux dr=
iver
> >> related reasons. I couldn't have patches that fixed incorrect hardware
> >> definitions to be applied, because the maintainer would demand a chang=
e on
> >> Linux driver to happen beforehand. I've stumbled upon misconceptions s=
uch
> >> as thinking that a Linux driver change could break ABI. In reality, th=
at is
> >> nonsense because a driver change represents the implementation being
> >> changed, not the bindings. The implementation change can only be so th=
at it
> >> breaks compliance with the bindings.
> >
> >
> >We should be careful here.
> >
> >The device-tree bindings are the definition of the ABI. But they are
> >only words; what matters is the interface between the DT blob itself
> >and the OS drivers which interpret them.
> >
> >If we want to *change* that ABI in a way which breaks users of it, then
> >of *course* we have to consider a transition path for those users.
> >
> >That's true of *any* ABI, be it a command line, a library ABI, or the
> >device-tree bindings.
>=20
> First, let's agree on the two cases of changing the ABI. You either add
> new properties and rules (let's call them definitions) to describe the
> hardware more in detail, or you change the existing definitions which
> would break the ABI. As it's irrelevant to my point, I'll simplify the
> valid reasons to break the ABI as: The existing definitions wouldn't allow
> the hardware to be properly described.
>=20
> >
> >So where you say, "blocking my changes on the device tree definitions
> >because of Linux driver related reasons", that isn't necessarily wrong.
> >A breaking change to an ABI *needs* to have a transition plan for how
> >its users get from old to new without a flag day.
>=20
> This is a concern for the Linux kernel. If we demand the compliance of the
> Linux kernel with the changed device tree definitions from the people that
> made the change, then we can't talk about a complete autonomy of the
> device tree development from the Linux kernel development. I should be
> able to submit patches with the only goal of adding or fixing hardware
> definitions. Either I've broken the ABI with a valid reason or added
> hardware definitions, I must not be forced to do Linux kernel development
> for my device tree patches to be applied.

I'm going to require that it is done, by someone, before I ack a
dt-binding change. I'm also going to require that it's not breaking
other projects, like U-Boot, that pull in the dt-rebasing repository.
If you change the ABI, and therefore change the source files, you also
need to change the users.

And I would have those requirements whether or not the bindings lie within,
or outside of, the kernel tree :) Suggesting that decoupling the bindings
and kernel would allow that to be relaxed is, in my view, silly - it
would just prevent anyone from being "blindly" able to pull in whatever
the latest revision of platform devicetree source files is, without
substantial risk of regressions. That's a downgrade from the status quo
in my view!

The far harder thing to deal with at present is ABI "compliant" changes
to devicetree source files, for example where a new dedicated clock node
replaces a set of fixed-clocks, which is something we need platform
maintainers to become more aware of as use of the dt-rebasing
repo/OF_UPSTREAM grows in U-Boot.

Cheers,
Conor.

> I should not need to know the C
> language to do device tree work. If we want more folks to do device tree
> janitor work, let's not add in unnecessary requirements.
>=20
> Device tree definitions are not just for being compiled into a blob for
> drivers to interpret. For example, I do regularly read device tree
> definitions to learn about the hardware being described. So it has a use
> for documentation as well.
>=20
> Ar=C4=B1n=C3=A7

--FfrAk5Ta2Sde701h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuRktQAKCRB4tDGHoIJi
0kh3AP0YG52bPXHhdo8ROQOQaVGe3s+27waUXTyUa0z1wJQQ3gEAk3fwOxWqbnZ0
DzHUplrzPk2JwUAGAi6LI/DvGiY+bAI=
=Mc/s
-----END PGP SIGNATURE-----

--FfrAk5Ta2Sde701h--

