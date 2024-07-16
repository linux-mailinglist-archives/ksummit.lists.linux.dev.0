Return-Path: <ksummit+bounces-1435-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18793206B
	for <lists@lfdr.de>; Tue, 16 Jul 2024 08:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F4D31C21229
	for <lists@lfdr.de>; Tue, 16 Jul 2024 06:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5711C6A0;
	Tue, 16 Jul 2024 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IHsyRqWv"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8551862C
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721111137; cv=none; b=NRB1yGQ9A/6B0XJJOyidq3p1MxVmCFxwsSWkOpseQalfnmH+Z7n++uzYNZE9VGmfwJ/Z2ZmEw2Jr9p0zHDOHpilu6mPIsmtkUcGzMtN7XZZakPiSAwONGetxHEnW5GQPEr6KOV8iCnEf+COObk/apYDpeQ1BjjMcUpGjjhfft5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721111137; c=relaxed/simple;
	bh=wiPOm/k6EKMsKrTi0Yes++Ge6FdHbYQtV732NkY3YME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ene0CtiJnJKNBXx2XlR2EsKeud/lMimB160c7sSbINiD6DHEjD8GUJ0sWltGuNyc7HhHVzh1RYjkQLNenqio/nePzluz05aTeAcc5avA2H09awpGbkLgi+36RBiyTbuXVX9nwT0MBeN/18YdVMkEP1i88GUoEx7SAg7L6p8BBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IHsyRqWv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3358C116B1;
	Tue, 16 Jul 2024 06:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721111137;
	bh=wiPOm/k6EKMsKrTi0Yes++Ge6FdHbYQtV732NkY3YME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHsyRqWvCf3Rdo6dHRDzNqyMsGfKFm1HAQCY+ZkfvuCavDu0m+/SBg0vyQRPBI8c3
	 AbsHen6lEXhMTPunJDC1uU1UiROEVr1UvalaSW6IdYHbx413vAZ2D4Sg4CrHsfaRAb
	 7vmASRfrfo6jrzW+5Bq392hNhCQye6RHu4TX2ZYI=
Date: Tue, 16 Jul 2024 08:25:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <2024071612-bauble-handset-93de@gregkh>
References: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
 <8a0d05e1-71be-445e-afcf-4764149ea60a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a0d05e1-71be-445e-afcf-4764149ea60a@sirena.org.uk>

On Mon, Jul 15, 2024 at 07:04:34PM +0100, Mark Brown wrote:
> On Mon, Jul 15, 2024 at 04:40:01PM +0200, Greg KH wrote:
> > On Mon, Jul 15, 2024 at 04:34:19PM +0200, Alexandre Belloni wrote:
> 
> > > I'm very surprised that it didn't cross anyone's mind yet that
> > > contributors and maintainers don't bother using Cc: stable because they
> > > don't care about stable for various reasons. So the behaviour is nether
> > > good nor bad and doesn't have to be penalized.
> 
> > Totally true.  The first rule of the stable tree is "it will not put
> > additional burden on any developer or maintainer that doesn't want to
> > participate in it."  So if you don't want to deal with it, wonderful,
> > don't take anything and just don't worry about it.
> 
> FWIW as we've discussed before I stopped adding explicit CCs for the
> most part since AUTOSEL is picking up far more than I ever would so it
> doesn't seem worth the effort to filter which is a variation on what
> Alexandre mentioned.

If you want to, we can add your subsystems to the "do not run AUTOSEL or
Fixes:" list and then you can just mark whatever you feel is needed for
stable directly.  We already do that for many other subsystems (kvm, mm,
xfs, and others), just let us know and we will be glad to do so as it
reduces our load AND it lets you be in control of what is in stable.

thanks,

greg k-h

