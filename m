Return-Path: <ksummit+bounces-1414-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5699316DE
	for <lists@lfdr.de>; Mon, 15 Jul 2024 16:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B3E41C20B0D
	for <lists@lfdr.de>; Mon, 15 Jul 2024 14:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBE118EA85;
	Mon, 15 Jul 2024 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QMaaXWB1"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BBF18EA84
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054065; cv=none; b=UA5PvuEDqIv38HQhhy1BnMhPJntTvzNeYF5VIQsu2ht7XFnlgTg+JKCA7Tp44Q5QDcMSn0gnkjm9aOZ5VICWU54vIYeewMsufu//AtLVu5v3WRAUOMcZ2kVBy/j3tu5yJmUACnMk6jK5vHWlDaIWHm+qNujT2RuePSJN+69p/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054065; c=relaxed/simple;
	bh=PkH0fWSTovV4mHqR5yQqv+1yHaAeYFCML8U4sSrGD60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOu8TmEZGtXoseX7QkWu0BNSekYOrZS03DtK446HALOW/M5rU653PbueQ92vstSvl11yWvkukmZ+QDG6w2+nxY8AophjNjKiIPZOYFPf5+fyzVJg2WOO4ea6TD6Gsh0GhufLMaySYdxWdRULPpHwSim1bI1/FYPCrSHSiv/Q+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QMaaXWB1; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EF21240002;
	Mon, 15 Jul 2024 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721054060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yg/5GEZst3XS4T85Z4UwzJ7UZbT3nkI1nSrBxM+Xnpc=;
	b=QMaaXWB11cz8Wr1yRNTHizHJZQPORSZtzONH1SHTa6KabR6aYBqGnJEOqRrykrOJqNCQdZ
	Tu9tFjahCTJ0/yOykWuX46QHoCZsmLP4tqU+iJh0B/GlidqE8KovR3qaB5XipR80jHi+g4
	gGlx596IO9BPGjMJzuqiGmPcYcljesUWWUvdMqS/qTiQnR9ai7FJneeAuNsorSZYNQXztS
	MMWAfsRkuKyCgaTuu5HrSiLo0W597QNrFrWTzfwskFJjRbod3GUAe/6Mkqnq4+t7RCfyvs
	v6FELm6yO1LIWRxR6+NYsQG8Eh9wI47utjOVH5HB/CODF7y23+leEhRDmg2Zow==
Date: Mon, 15 Jul 2024 16:34:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <202407151434198c3715e9@mail.local>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
 <ZpQdJpKhIzmf3veU@sashalap>
 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 15/07/2024 08:52:54-0400, Mimi Zohar wrote:
> On Mon, 2024-07-15 at 08:48 -0400, Mimi Zohar wrote:
> > On Mon, 2024-07-15 at 10:02 +0200, Greg KH wrote:
> > > On Sun, Jul 14, 2024 at 04:09:06PM -0700, Linus Torvalds wrote:
> > > > On Sun, 14 Jul 2024 at 16:06, James Bottomley
> > > > <James.Bottomley@hansenpartnership.com> wrote:
> > > > > But we know how to enforce a unified view of process: we document it in
> > > > > Documentaion/process ...
> > > > 
> > > > Hahhahhahaahh.
> > > > 
> > > > Ahh, you're such a kidder, James.
> > > 
> > > Yeah, and that's the issue here, we have whole subsystems and many many
> > > maintainers and developers that do not follow this at all, hence our
> > > need to pull into stable commits that only have a "Fixes:" tag on it.
> > > 
> > > Now we can start running a bot on all submissions that says something
> > > like the one that I have been doing for the USB subsystem for the past
> > > few months, here's the text I use:
> > > 
> > > 	- You have marked a patch with a "Fixes:" tag for a commit that is in an
> > > 	  older released kernel, yet you do not have a cc: stable line in the
> > > 	  signed-off-by area at all, which means that the patch will not be
> > > 	  applied to any older kernel releases.  To properly fix this, please
> > > 	  follow the documented rules in the
> > > 	  Documentation/process/stable-kernel-rules.rst file for how to resolve
> > > 	  this.
> > > 
> > > But I doubt everyone wants to see that polute their mailing lists :(
> > > 
> > > Anyway, if people want to stick to the current, documented, process,
> > > great, but as-is, trying to get people to follow that is rough and not
> > > really working.
> > 
> > Sigh, I'm one of them, but I'd like to move to backporting "stable" only.
> > Unfortunately, the more that you backport "Fixes:" the less likely maintainers
> > (me) will remember to Cc stable.  Other than email, is there a way of letting
> > you and Sasha know to only backport those with "Stable"?.  Instead of sending
> > the email above to everyone, only send it maintainers who don't Cc stable
> > properly/haven't notified you that they will.  The emails should get everyone
> > else's attention. :)
> 
> Basically, reward good behavior, penalize bad behavior.

I'm very surprised that it didn't cross anyone's mind yet that
contributors and maintainers don't bother using Cc: stable because they
don't care about stable for various reasons. So the behaviour is nether
good nor bad and doesn't have to be penalized.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

