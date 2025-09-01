Return-Path: <ksummit+bounces-2262-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 056EFB3F142
	for <lists@lfdr.de>; Tue,  2 Sep 2025 00:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D2F1A87217
	for <lists@lfdr.de>; Mon,  1 Sep 2025 22:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3D4284B42;
	Mon,  1 Sep 2025 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOamZqfn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F37261E;
	Mon,  1 Sep 2025 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756767164; cv=none; b=LG2DR9CV2b0ScXUd83Pif+X/kJPtTgGGQNkDUW8TERJtXbbeYl3CON5roLJ7olUYPymbNoAPPYtTa7+d2fI+JUEEdM08bdMx7fgcwNxuIXeZseC+7B+gyf0B9OZ9K0sP3iR8xaM8PL1s8+MDNPuc2N/WpKHd3mfCArsAPS/GWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756767164; c=relaxed/simple;
	bh=Sa6tqWWHTfJEsIwOz6x3GS5M6e1aitXmrIAc8bs9wq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK6VULFJgOaANMGkUdueNdfHuCl9RVoNEtDzUH07uKASfkne+QeG9O29Fcj3gin443jH53r31X3J7GppqYJRPD7mtOxc5MYEwR5TuQGPzUuzfaq3uKcdxAINH6M822ARImCyPVqcQtrDrm/4N7pFdBdDEQpnMp1nOFLCvT0HX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOamZqfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB4CC4CEF0;
	Mon,  1 Sep 2025 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756767163;
	bh=Sa6tqWWHTfJEsIwOz6x3GS5M6e1aitXmrIAc8bs9wq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOamZqfn1KKEmEHutkW/lCbKHEZw1mPPVaEqU+tcQIzTtX4cgey7ZuV1gV2FA71Qn
	 Qawbvdkr8c1T8c/rq1Ntl6bQh229MImwYyzP6EzND+DbwjbtLZvC+SRXs5s95mDqw/
	 /3mXUNQT5nKR6jb6WKYcCEGSW+jUyxcTLpXJ2kcDWGrVFC3edFZjznQh2kTV1SCAL6
	 CA9AwnPxqGm3fAqRpp1NZTh9EOwHDo47DlQJ/FHmBzKCK8KszEkhV7Rs3F6Bt2J/bR
	 s+UIju1i/GRf0xK2aIyOSvAwwMJ8wc8msZuWfewKFFxGuyu4CyLO9K1Yp3f3IPgJ+E
	 o+qG7CWrDO/+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utDOD-00000003Oqp-1qZt;
	Tue, 02 Sep 2025 00:52:41 +0200
Date: Tue, 2 Sep 2025 00:52:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mark Brown <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	ksummit@lists.linux.dev, Linux Documentation <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <sql6hd7r3dbqcpbuzzgkb7ovxdiof4gbt2flphjpjzwihvjqju@hx6bdvtasky5>
References: <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <873496yqqt.fsf@trenco.lwn.net>
 <7f507a0e-3493-4b9f-a6b9-912efe49e5ba@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f507a0e-3493-4b9f-a6b9-912efe49e5ba@sirena.org.uk>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Sep 01, 2025 at 07:40:21PM +0100, Mark Brown wrote:
> On Mon, Sep 01, 2025 at 12:25:30PM -0600, Jonathan Corbet wrote:
> > Mark Brown <broonie@kernel.org> writes:
> 
> > >   make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total
> 
> > That ... is weird... it takes me a little under 3 minutes to do an
> > htmldocs build, using a capable but not stellar desktop machine.
> 
> > Which version of Sphinx are you using?  If you're not on Sphinx 8, you
> > really want to be; they finally fixed some really nasty performance
> > problems with that release.
> 
> I appear to be on version 5.3 which is what's in my distro.  I will get
> 8.1.3 when I upgrade, I don't really have any intention of manually
> installing an unpackaged copy.  Three minutes would be more reasonable,
> though without a clean build (and I guess something that errors on
> warnings so I don't actually need to look at the output myself) I'm not
> sure I'd notice any issues.

You can install it on a Python virtual env, using it only for doc builds.
Procedure is quite simple.

As Jon pointed out, from 3.x to 7.x, Sphinx had lots of performance
issues. On my 64GB RAM system, I even had to enable swap to avoid OOM
killer when testing builds with 7.x.

All of those were gone on 8.x. Build is about 3 minutes, on a big machine
and even on my 16GB i7core laptop.

Btw, on my experiences, building on Sphinx (even 8.x) with -j8 or -j24
is about the same time.

Btw, once this series is merged:

	https://lore.kernel.org/linux-doc/cover.1756740314.git.mchehab+huawei@kernel.org/T/#mdca010445a79da125b5113ca70da1b1d03a443e6

it is possible to build the docs directly at the virtual environment
without needing to enable/disable by calling directly the new 
sphinx-build-wrapper script:

	./tools/docs/sphinx-build-wrapper htmldocs -V

It will automatically search for the latest sphinx_<version> 
(or sphinx_latest) at the Kernel dir and use it for doc build. 
-V also accepts an optional argument if you want to force it to
use an specific virtual environment.


-- 
Thanks,
Mauro

