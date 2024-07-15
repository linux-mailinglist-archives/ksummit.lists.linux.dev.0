Return-Path: <ksummit+bounces-1418-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32093175F
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0981F221F8
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8931E18F2CF;
	Mon, 15 Jul 2024 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z4tfcsKd"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0773B3A1A0
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056250; cv=none; b=Aiq4QYncyGJuVFWKtTQrXVNoeVGpRhzCFpppb+MhO8gsiBGzyYHlp7DH+FvufbJnMQX4PxJnXTcojvyezqqJsa7sis3v6QcGIJkAe45UjNWrYbCrHctmsGreRrxKJVT+R08060XihMZ7TA7zyzgekrFXEDU+wPfArjFtaYGWfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056250; c=relaxed/simple;
	bh=xRSFpngn5DvmG24qKuErykaLvqiOg05OThKmXTOAlYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaX/H2UD2TVKYIUqpCTK4gXYJKr9SDLGpKCxfNg02ZqiOXzIgJai4+gcKa9o5zwLJKalDF+WQ9uVmM1XU8zObsZ5TXe0zry/RMFl7lWKjnAsbtgQB2meyzmvr7XrC3Nbm8N3DWDlB2/pumjIImYFXplIO5/eyQtIBnhHmBDfiaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z4tfcsKd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319ACC32782;
	Mon, 15 Jul 2024 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721056249;
	bh=xRSFpngn5DvmG24qKuErykaLvqiOg05OThKmXTOAlYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z4tfcsKdEoyXk4BOBYAdLUPNBrv5bl+h9/FB36EaJtCC3S5VSXcc7UXrszo3vq8Bk
	 lswqp1Jqc8t3C+252gGWmllWRr7T2agocvOny8DVVLL2z7gcLabBgTU0qiaihUofKY
	 No/MbFiqpDZgtM3XGj05EC7ItbRb5wG0bixbntRw=
Date: Mon, 15 Jul 2024 17:10:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <2024071537-unskilled-boney-2fb6@gregkh>
References: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
 <87h6cqya32.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6cqya32.fsf@trenco.lwn.net>

On Mon, Jul 15, 2024 at 09:00:01AM -0600, Jonathan Corbet wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Mon, Jul 15, 2024 at 04:34:19PM +0200, Alexandre Belloni wrote:
> >> I'm very surprised that it didn't cross anyone's mind yet that
> >> contributors and maintainers don't bother using Cc: stable because they
> >> don't care about stable for various reasons. So the behaviour is nether
> >> good nor bad and doesn't have to be penalized.
> >
> > Totally true.  The first rule of the stable tree is "it will not put
> > additional burden on any developer or maintainer that doesn't want to
> > participate in it."  So if you don't want to deal with it, wonderful,
> > don't take anything and just don't worry about it.
> 
> I must confess I've been wondering about this, since I've seen the above
> policy expressed a number of times over the years.  Stable participation
> is entirely optional.  But then this conversation has included things
> like:
> 
> > All our documentation explicitly says that a stable tag is a *must*,
> > we've been nagging folks to add it when they haven't, and we give them
> > the spiel whenever we're asked why a certain fixes-only commit didn't
> > make it into the stable trees.
> 
> Sasha, https://lore.kernel.org/all/ZpQbQa-_8GkoiPhE@sashalap
> 
> > Anyway, if people want to stick to the current, documented, process,
> > great, but as-is, trying to get people to follow that is rough and not
> > really working.
> 
> Greg, https://lore.kernel.org/all/2024071528-cahoots-reacquire-9eab@gregkh

I say this as many maintainers/developers get the "Fixes:" tag stuff
mixed up.  We had a very senior/core developer email us about this just
this weekend, they thought they were following the proper process and
didn't realize that "Cc: stable@" was the proper way instead.

That's what I mean, for people who _WANT_ to participate, they get it
wrong, as Linus points out, none of us read the documentation we have :(

> So, to me, the real question here is: what is the actual policy?  Are
> developers and maintainers expected to put in stable tags the way they
> are expected to add Signed-off-by, or is it a fully optional practice?
> In the latter case, I'm not sure how much good messing with the tags
> will do.

It's optional, but if you DO want to do it right, please cc: stable@ as
that's the documented way AND you will get proper integration into the
process (i.e. emails when things fail to apply.)  If you don't cc:
stable@ but do just use "Fixes:" and haven't told us otherwise (see my
previous email here), then us stable maintainers just have to guess and
try to apply "Fixes:" commits as they obviously are fixing real problems
that people have and report and want resolved.

thanks,

greg k-h

