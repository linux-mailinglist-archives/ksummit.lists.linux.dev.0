Return-Path: <ksummit+bounces-2293-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB16B4248E
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BF0B6829A1
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C9A313551;
	Wed,  3 Sep 2025 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="qxvVVLn2"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8631282D;
	Wed,  3 Sep 2025 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912282; cv=none; b=KHMOUs/MQ6Crk0QCeZ4xHnvFG/pVtw+T/CjSALKUbeNVN+lxeXyxdAaxDEFL0+UarO9kKaLt7mKOFGzW7ZIZlf+wU4riESJIxT/6GIBgL2839g09cAzX4zFCMhw8dxatByWBfFm+/152fn7W7QkbQKYLMCl5ro63yxo0ADAZUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912282; c=relaxed/simple;
	bh=jJ3psmTGSuHX1dBpyRq09yLEoRGYWmfk52malZjuQhE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gytDQxGu9vygaytjdl6gjreT0ATZxf4+K2BXRNfq6EXUFQVRQeoKLn2tTMPQse62qaDi8wBqF2xATBqzXyK1i/WA+6JGBtvlaIg5oAHwGIX7XLf7PeBJ2gs4NviKBqjOao8IRdBKh6sOTHZPyZ26FZTrWW8ccrkp6wbeNxApQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=qxvVVLn2; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ARY+G+c8GokLAgAkYt2z3S8veAoL5jqxpoI2cUY3AVc=;
	t=1756912281; x=1758121881; b=qxvVVLn2xQKXx8KwDQRCxYihVblcuLMhw8QzAfD2MDgFMy3
	Ohf7+Lf4pH4Ht5Z/GCyqfASgJHtKNxFyyQwqjmw1dXMoK0V9vP7hYzsjD+SQ3L2JRAcTNIluHzI0T
	K6br87320UF+vh5ovZ+HxelFRAqTxOtaPPA2El27z47kJSRZIucw3GaCnbd9fQTci3vw5T/iqPHPR
	VIj5PcqM2jTcemAGHf9BDN68uz6+m/vwsVdS1cxuJ/JwnxvLmJR0bHa4EtPjqQOZr4vGDn2Y09TAc
	hWHd7j2J3nkZMqbB2uG6Vy3ppkq7eErfTH4gkp67qJRuFc01k0n5sXCHwBm5BCvw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1utp8j-0000000C20a-1swq;
	Wed, 03 Sep 2025 17:11:13 +0200
Message-ID: <874a85f2154d6b05635d856dcdd85d4715d19d3c.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum	
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation	
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya	 <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Date: Wed, 03 Sep 2025 17:11:12 +0200
In-Reply-To: <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
References: <20250902141434.3e5b14e4@foz.lan>
	 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
	 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
	 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
	 <87frd4vfys.fsf@trenco.lwn.net>
	 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
	 <20250903124229.332dfeae@foz.lan>
	 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
	 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
	 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2025-09-03 at 16:57 +0200, Mauro Carvalho Chehab wrote:
> There are actually 3 different issues that depend on python version:
>=20
> 1. sphinx-pre-install:
>=20
>     This used to be a Perl script. The goal is to check if sphinx-build
>     is installed and works, and identify missing dependencies.
>=20
>     The problem is: if one installs python3xx-Sphinx, instead of
>     python3-Sphinx, the script will fail, except if it first switches
>     to python3.xx;

So let it fail. Fail is fine, at least it's a clear signal. The python3-
Spinx package will anyway be a sort of meta-package that's basically
empty and depends on a specific version.

> 2. sphinx-build logic inside makefile, required for doc-specific targets:
>=20
>    - If python < 3.7, doc builds fail;

Fine, python 3.7 is really old by now, if you actually have python3=3D=3D3.=
7
you probably have other problems anyway. I don't think we need to
support that.

>    - If python3xx-Sphinx is installed, build only works if started using
>      the right python3.xx exec

Yeah, but again, we can require python3-sphinx here.

> Now, for (1) and (2), it should be possible to allow building docs even
> if the distro requires Python < 3.7, providing extra packages for newer
> Python, as almost all distros do. See, several distros require python
> on their minimal install images, because it can be using during package
> install. Removing the default python replacing by a new version may break
> the system, as the newer version may not be backward-compatible.

Umm, no? I'm not sure there's a need to cater to truly ancient software
in today's kernel build environment. Even debian *oldoldstable* has
python3=3D=3D3.9:
https://packages.debian.org/bullseye/python3

> The best alternative seems to check if:
>=20
> - python version is bellow the minimal supported version;
> - there is a newer python binary at PATH;
> - check if sphinx-build runs with the newest version.
>=20
> If all those 3 conditions are met, build docs with a version that works,
> printing a message to tell the user what Python binary was used.

I still disagree. The only predictable thing is to use "python3" and
associated python3-xyz tools, and let things fail if those versions are
too old.

Picking a random different version that will depend on the kernel
version etc. is just going to introduce more moving parts and will
eventually be painful.

johannes

