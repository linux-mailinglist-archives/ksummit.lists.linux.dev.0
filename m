Return-Path: <ksummit+bounces-1265-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E90908CE7
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A185F1C20C2E
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7819D8BE;
	Fri, 14 Jun 2024 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0V/y+V2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD59441
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718373696; cv=none; b=o2+Aelb+qTSocEHBNb20b/o+ohiPPuQopmVkgbzDeS1i5Z38+Ii4VExCBET6c6D1woULUBeFvdZxVJuJ3Qfds8a9dzV6bJFI3/DVrK6X+Sw2CkB7OqC3cswK4tV7XdqdgWkWyfUCHa2TGB6rctc55IzecOyMPBcN+CtXOdafPSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718373696; c=relaxed/simple;
	bh=0oESls6+EeJabknlFkXdx+alzzJhrcaR/36jKTvWChw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7WkH2OEAKceCt+TAu+7uf99x4RhppKOhFNnsOjaTeOobBu82hfa+X7Tj3hyjhhSLX0fnbRSCBjKK0dEaJRzWLBy1Qk5Es2Ic0fCJTeohtfJY+0EOLey35zH6IxqV9qHnZCkUyW/j1nwVeng3Ssi8yk3qQNZ6P2UN7jYPp0oQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0V/y+V2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3471AC2BD10;
	Fri, 14 Jun 2024 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718373695;
	bh=0oESls6+EeJabknlFkXdx+alzzJhrcaR/36jKTvWChw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0V/y+V2pQ4uwPiiGzB/5XMa00Na5i47XsCHSz7C/His1IsBTZMPPSpZiYcjJi1gs
	 srUra9fOCOKjt4nluVwqzOoK2tBSHa8WPw63HKWWz+D2ZMiL5aQOv0M/Wc4UBvWt4K
	 R5ouxHHhO0L83EjtbeLx4ga8yfTV2qtROb7EuoYUIp4BHSycUEM1gByB0uu2/cIfVZ
	 kMB80DJGgVttiKxXQswCf6jVzu18p5a4uBhsvx30QBa3JRMZOrG+Q8JZOy/umeoI0G
	 xkTAReJT9SnuHMPLxRnxBr7jv4hq3BNA/m3vLpcGbNMKmvJpl3PgI1q9BdH/jAi8Fe
	 oVphexUaljYLA==
Date: Fri, 14 Jun 2024 15:01:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression are
 fixed in latest stable series
Message-ID: <ZmxNPE0a8nB5YezI@finisterre.sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9q6078soWfElmRQ"
Content-Disposition: inline
In-Reply-To: <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
X-Cookie: Your love life will be... interesting.


--s9q6078soWfElmRQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:32:27AM +0200, Thorsten Leemhuis wrote:

> I propose we extend the implications of the "no regressions" rule so
> that mainline developers must ensure fixes for recent mainline
> regression make it to the latest stable series.

I do note that there is already a bunch of disquiet about what makes it
into stable...

> """Developers must ensure that fixes for regressions introduced in the
> last development cycle make it to the latest stable series -- typically
> by adding 'Fixes:' and 'CC: <stable=E2=80=A6' tags to the patch descripti=
on's
> footer."""

Personally I stopped bothering with manually Ccing stable because the
stable team already picks up much more than I'm comfortable with,
devoting any effort to thinking about what might go to stable just
doesn't seem like a good use of time.

We also already have problems with people spamming fixes tags onto
things that are not really bugs or where not much effort appears to have
gone into identifying a relevant commit, I think some people have
internal process pressures on having Fixes tags for the sake of it.
Demanding that people who don't really care fill in the blank to appease
some workflow strategist doesn't seem likely to improve the quality of
information provided any.

> But I'm bringing this up anyway, as users afaics expect "fix recently
> introduced problems with new minor releases', as it is a pretty normal
> thing in most other FLOSS projects that have minor releases. A lot of
> kernel developers are already doing what I proposed anyway. It could be
> viewed as fair to our user base, too. And without it the "no
> regressions" rule might be considered hollow.

I think a lot of projects have a much greater expectation that a large
part of their audience will directly use their releases, while obviously
people do directly take and run kernel releases the much more common
path is via some third party that usually does some integration and QA
work.

--s9q6078soWfElmRQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsTTkACgkQJNaLcl1U
h9DxfQf/QmpNieyF119cUBL2X6a1URRNCGYzgYwa3ddjS6zngvGVrK0fb6XQNQZ3
qL7xJo8c/80AuNX1UlockvIusDc3b4DpQoxVNqIFjgq0kagsBi7dZER6gRfE5PBh
3OALF4tIdbNqaj4CHHFoWYEuLCDWU+wWLi4zwQyXAhh2DpqpvvZeCwKRD6Z+LpQo
eRf9+LHZPIEtlRM6AoQtlN6jxj+iuvjzFoWSkFeApXbWJ8QPffwPWqPOPUk2socN
f0qLF4k5n7VmvorvyE4im7JOtU8oP1N1IDhW2LCXEWxh7kHG8Sh0krN82d3dytET
1fsSo3DxTrCMJ8oq0wP7U0S/BwuRoQ==
=qS2m
-----END PGP SIGNATURE-----

--s9q6078soWfElmRQ--

