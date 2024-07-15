Return-Path: <ksummit+bounces-1415-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AA9316F5
	for <lists@lfdr.de>; Mon, 15 Jul 2024 16:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4561F21F4B
	for <lists@lfdr.de>; Mon, 15 Jul 2024 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EF918EA71;
	Mon, 15 Jul 2024 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xF9pkaqn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B52433B3
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054405; cv=none; b=aM+ckh/b01UfOfqqzuiB6c54IyC9F7od/WP5Nlmon0ZxNIiNpk2bKAmPFcluc8dDEyg2r3Nk5P5k4nP4ZmY5xGK7z5TXTpsfG848fxL1MdlULmKVE3FUGmgwxD1dO6N8JNKblaPhSJRdRb9d6bd4+CQwC8sEBmx/bXlLX0exlA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054405; c=relaxed/simple;
	bh=J5fNXeuToTmfBa6mRjsr9AdBPri4ylFHpBdkduR2ERw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfWsU3zhRrBFdWZv/JYgIegQefPhGrjlCRKgqCV6gpOC7dB/Q6YvEMOgxR920grWljFNAhbgnyxF2zAl4hGE4EhNhU6cENhRTUGAuDJ3t8GdHRGk3S9MVuD3NCQqMXrVGMsdudJQ8o3ejXzQvbs9KlW3CQe9LuY4XTOvskolsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xF9pkaqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C553C32782;
	Mon, 15 Jul 2024 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721054404;
	bh=J5fNXeuToTmfBa6mRjsr9AdBPri4ylFHpBdkduR2ERw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xF9pkaqnlRwZXkV5YJnKMxYN1/n3h9mAl/WaEUrlCDUvDtMWQA+uqTylAF+iDVESZ
	 ak7Fh6ZVVEfnZIMqAmpwYzmcBU4aHWjzWkopbp/rfK+OnJuznD7waS7vQB7ttZveu3
	 cllI5rvhLfAh5ZFBY0G4pSV/MQyg7SO4JXuGl9zE=
Date: Mon, 15 Jul 2024 16:40:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <2024071515-zestfully-womankind-1901@gregkh>
References: <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
 <ZpQdJpKhIzmf3veU@sashalap>
 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407151434198c3715e9@mail.local>

On Mon, Jul 15, 2024 at 04:34:19PM +0200, Alexandre Belloni wrote:
> On 15/07/2024 08:52:54-0400, Mimi Zohar wrote:
> > On Mon, 2024-07-15 at 08:48 -0400, Mimi Zohar wrote:
> > > On Mon, 2024-07-15 at 10:02 +0200, Greg KH wrote:
> > > > On Sun, Jul 14, 2024 at 04:09:06PM -0700, Linus Torvalds wrote:
> > > > > On Sun, 14 Jul 2024 at 16:06, James Bottomley
> > > > > <James.Bottomley@hansenpartnership.com> wrote:
> > > > > > But we know how to enforce a unified view of process: we document it in
> > > > > > Documentaion/process ...
> > > > > 
> > > > > Hahhahhahaahh.
> > > > > 
> > > > > Ahh, you're such a kidder, James.
> > > > 
> > > > Yeah, and that's the issue here, we have whole subsystems and many many
> > > > maintainers and developers that do not follow this at all, hence our
> > > > need to pull into stable commits that only have a "Fixes:" tag on it.
> > > > 
> > > > Now we can start running a bot on all submissions that says something
> > > > like the one that I have been doing for the USB subsystem for the past
> > > > few months, here's the text I use:
> > > > 
> > > > 	- You have marked a patch with a "Fixes:" tag for a commit that is in an
> > > > 	  older released kernel, yet you do not have a cc: stable line in the
> > > > 	  signed-off-by area at all, which means that the patch will not be
> > > > 	  applied to any older kernel releases.  To properly fix this, please
> > > > 	  follow the documented rules in the
> > > > 	  Documentation/process/stable-kernel-rules.rst file for how to resolve
> > > > 	  this.
> > > > 
> > > > But I doubt everyone wants to see that polute their mailing lists :(
> > > > 
> > > > Anyway, if people want to stick to the current, documented, process,
> > > > great, but as-is, trying to get people to follow that is rough and not
> > > > really working.
> > > 
> > > Sigh, I'm one of them, but I'd like to move to backporting "stable" only.
> > > Unfortunately, the more that you backport "Fixes:" the less likely maintainers
> > > (me) will remember to Cc stable.  Other than email, is there a way of letting
> > > you and Sasha know to only backport those with "Stable"?.  Instead of sending
> > > the email above to everyone, only send it maintainers who don't Cc stable
> > > properly/haven't notified you that they will.  The emails should get everyone
> > > else's attention. :)
> > 
> > Basically, reward good behavior, penalize bad behavior.
> 
> I'm very surprised that it didn't cross anyone's mind yet that
> contributors and maintainers don't bother using Cc: stable because they
> don't care about stable for various reasons. So the behaviour is nether
> good nor bad and doesn't have to be penalized.

Totally true.  The first rule of the stable tree is "it will not put
additional burden on any developer or maintainer that doesn't want to
participate in it."  So if you don't want to deal with it, wonderful,
don't take anything and just don't worry about it.

Many subsystems have also opted-out of the autosel and Fixes: merges as
they don't want that to happen for them.  We gladly support that, anyone
can just email us and we will add them to the list, or they can send a
patch to:
	https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list

Again, we do NOT want to penalize anyone here, that's not how kernel
development should work, our maintainers are overworked as it is.

thanks,

greg k-h

