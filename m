Return-Path: <ksummit+bounces-733-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423255BF33
	for <lists@lfdr.de>; Tue, 28 Jun 2022 09:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 9A0DB2E0C26
	for <lists@lfdr.de>; Tue, 28 Jun 2022 07:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7133D62F;
	Tue, 28 Jun 2022 07:43:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3926624
	for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 07:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FC9C3411D;
	Tue, 28 Jun 2022 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656402203;
	bh=a9/bymyLDuTAXPOi8MEQNMnobpZC924YF+DWJf9e4Ng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UaKr/g58oW7oGiBAxok0ntegj8vt6ri8ybbHqeCDH8DQGOIUcFPZel14aeI9R6RKf
	 O3zFhVMl4mDfFUwAFCe3xUEV5TR3kFQLtvMMHtA6F36vh7v6W1TjqwxHHm622XsP6V
	 CiuOxnH9zftRXSUxsPlG1nGwFFfIRqDLMtSyNWqWeXgH78wUivTt2PIp1uVMSVSCR9
	 Wun7QwjQC3gIIThvZZXSZjpr7C9sLNe+1rr80owMEcF1Zd3krzbvdH4dJ9kO8p8mzB
	 JIfgOL9ktRexokg8McdXymSgSWoMCJU+4v4xTiM3GPaDh4I5ymT23RcThuVIrpirsL
	 y7c+VzlixR8AA==
Date: Tue, 28 Jun 2022 08:43:17 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Markus Heiser <markus.heiser@darmarit.de>, Jani Nikula
 <jani.nikula@intel.com>, ksummit-discuss@lists.linuxfoundation.org,
 ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220628084317.2f033ad5@sal.lan>
In-Reply-To: <87fsjqyvlx.fsf@meer.lwn.net>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
	<20220623105747.079ac92b@sal.lan>
	<87a6a38plu.fsf@meer.lwn.net>
	<20220624083307.159824bd@sal.lan>
	<963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
	<87fsjqyvlx.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 27 Jun 2022 09:27:54 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Markus Heiser <markus.heiser@darmarit.de> writes:
> 
> > IMO It is unnecessary that the build-chain must run on all
> > platforms and with all distributions.
> >
> > Who observes the Sphinx-doc & docutils development since (>15)
> > years is aware that with various (old) Sphinx-doc & docutils
> > versions no stable results can be produced, not without
> > complicating the build-chain.  And this is exactly the situation
> > we are facing today.
> >
> > The build chain of documentation has nothing to do with kernel
> > development (at least in my opinion) and should be decoupled from it:
> > maintaining one defined build environment is enough work ... this
> > becomes especially clear if you (as Jani recommends) rely more on
> > sphinx-modules and widely used tools.  
> 
> The counterargument to this is that we want as many developers as
> possible to be able to build the docs and contribute to them.  We can't
> complain that developers have broken the docs build if we don't do what
> we can to help them do the build themselves.

Agreed.

> One of our longstanding contributors is on Sphinx 1.8.5:
> 
>   https://lwn.net/ml/linux-doc/4c403239-3c71-4ab9-2168-f7e9d77008b2%40infradead.org/

If he migrates to Leap 15.4, he'll either get 2.3.1 (default package)
or 4.2.0 (alternative package):

	https://download.opensuse.org/distribution/leap/15.4/repo/oss/noarch/python3-Sphinx-2.3.1-150400.1.7.noarch.rpm
	https://download.opensuse.org/distribution/leap/15.4/repo/oss/noarch/python3-Sphinx_4_2_0-4.2.0-150400.11.6.noarch.rpm

> I would like to narrow our range of supported versions, but I really
> don't want to cut people out.
> 
> The real question, perhaps, is whether requiring people to set up a
> virtualenv to run a supported version would be too much.  It's something
> I worry about.

Installing distro-specific packages likely covers a broader group of
developers than requiring virtualenv/venv.

However, if we decide to move on, removing the version-dependent
hacks from the build system, it would mean that the minimal version
would be 3.1.0. On such case, there won't be Sphinx packages on some
LTS distros. Developers using such distros will be forced to use 
virtualenv/venv.

In any case, the script which checks if sphinx-build runs can recommend
either way. Yet, as the current default is venv, tests are needed to check
if it recommending python3-sphinx packages still work on all supported
distros.

Such script could also be changed to detect if the distro has a
native package >= 3.1.0, recommending it by default, falling back to
virtualenv/venv otherwise.

Regards,
Mauro


