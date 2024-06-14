Return-Path: <ksummit+bounces-1281-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78B908F59
	for <lists@lfdr.de>; Fri, 14 Jun 2024 17:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B881B2A871
	for <lists@lfdr.de>; Fri, 14 Jun 2024 15:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2056D2E6;
	Fri, 14 Jun 2024 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tg9uuItD"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03F2F3E
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379957; cv=none; b=Z+51ccwLMa/FqAaazjgFlsJWn1q+iTQ7yPYCAm5meWeMJsLIyg1/c8hBh6U0zD15U5zT4oL8xTQNjL/aMu+qpOt20s4ebEuE9oWjivX6ZprobrNDr/FEheUZUdMYKm7+XdtKQKGq+i0IIIkJySgc02hdn6t/4KdsMaLJcUenCKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379957; c=relaxed/simple;
	bh=QExBuipiKFvLfmyM2QXHYOZt4KC52MadwZd/I0W3GO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwY+9GbRzCfIagdYCJ5IxZ23kHYtyM98+6d4DTWZmepLkMG9ONWMs29fvjiy3ZJX5T14ON0caJMjekwIsnc/PlHL/zGPVqj34thz2Q5znnBjGEmsSKjDlj/DkdPh5YeRaaERVqcJ9Epstav8xlzvGK1kMX81B5a+kcohslKFy6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tg9uuItD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63CFC2BD10;
	Fri, 14 Jun 2024 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718379957;
	bh=QExBuipiKFvLfmyM2QXHYOZt4KC52MadwZd/I0W3GO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tg9uuItDQoxqUsgCr1Qcrc90epZDyvCe5tuJXgznAVk9D5Y0PzvQNz04RCz0kGIdp
	 ysAsbE6h/5RUAdcpZ+DaqXG6qedqJhonccgLaYgmkCkVyQ3pm3lTFzXQOB8bLbMxfm
	 sbIsS9wK8rT/NAbuWyurSTzA9UsXovAvx2nuITKf+9+o+zx7b+6kVY8GlgDhnY2EaQ
	 ouFNtnOFmWJmQ11SCrz0KLLXvaPO25ZyBAAbK25gYFiq2UqgcgU4U+hzXPtpkSkA4X
	 eik1k/ffsan5wNHgn7s1wrbeha2Jm2dl09ut3TZu/V8gPzYLwy3MZU7cx5uMXMhyQi
	 kT/jK0E9nNd+w==
Date: Fri, 14 Jun 2024 16:45:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <ZmxlsF4GlVy1Zf-0@finisterre.sirena.org.uk>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <20240614-almond-lorikeet-of-reading-6d959f@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DQ6HGXhaxzmBEMfh"
Content-Disposition: inline
In-Reply-To: <20240614-almond-lorikeet-of-reading-6d959f@lemur>
X-Cookie: Your love life will be... interesting.


--DQ6HGXhaxzmBEMfh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 10:38:12AM -0400, Konstantin Ryabitsev wrote:
> On Sat, Jun 15, 2024 at 12:29:09AM GMT, Michael Ellerman wrote:

> > Message-Id: sucks, I want a link I can open with a single click.

> But why would you want to, on a regular basis? Viewing the series submission
> has got to provide near zero useful info -- if it was accepted into the tree,
> then at most it would have a couple of stray code review trailers.

The two scenarios I run into really often are when doing archeology to
try to figure out if there's any extra context for a patch (eg, a wider
series it was embedded in) or when some problem has been found in CI and
I want to figure out who to tell about it or if anyone else saw similar
issues.

--DQ6HGXhaxzmBEMfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsZbAACgkQJNaLcl1U
h9Dccwf/VS+q88z/1xHMKPP+9A6J66NN7R4GVdn9RaIDpMx4RvlGa6q2nJONcqjf
Ptwo5Jn4jn+7EpefR82KLijBm4sX4daUQe4nCGRNhp/BV3tliaDfozXNxaiS706C
JVc6+n/zvwfci5OItrfQLxxk67y2dhNe2vqpPUNiou16CrH98bdJHPU5KfnGiok0
Qky3X8r5qXiLKQLgZABnFzolIt1iLTqoo1ts4/cZPvqU35qyRY5HAzJBKZXQ6J80
9IB7RgUzDhu4a3N/VQNBpsA9twE017p8qZ7VAkrS3cqOMOyTh7/VyI4wcq1+Svdk
lLcIoIo48QOzkTsg1fv6D+mduipZTg==
=U92/
-----END PGP SIGNATURE-----

--DQ6HGXhaxzmBEMfh--

