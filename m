Return-Path: <ksummit+bounces-2799-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJglCtKic2lqxgAAu9opvQ
	(envelope-from <ksummit+bounces-2799-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 17:33:22 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823CE788CE
	for <lists@lfdr.de>; Fri, 23 Jan 2026 17:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05045300E3BE
	for <lists@lfdr.de>; Fri, 23 Jan 2026 16:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BE22EF64F;
	Fri, 23 Jan 2026 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0HXdSKza"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835DF23A99E
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185995; cv=none; b=arOKoP5lYp8N74D1sAZj6xlsXiwvr4hgQOC2ClPO6DISnZ6uZq/K+33JUPHfZFzQb9I0pGbFDdr2esyTrVivs7a2WM5RSch6EgWSnoRr6Cto0Vg6qu0eM7GVFw9jnuPr5DN85takecYuXDdwOgiYm19CHEM8UFpmxKWSISR7AY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185995; c=relaxed/simple;
	bh=oB1+aXy1aHIBlEeyxJ/8eYXFpwaSpcpm9225Hgu7V3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnbWsa8ZFQ06YTKDMCMFL86waBOIlEKXjVWa34bzwmSIvhRi7x4h4ZZdOb9mBmvMZ8NCwzsPguPqKPw4Hf/eN3L/BKQusKaq38zacdF/0CvJtJcj5cfmyDfC2sTMfyMpbX+iqmonIWTRETk+yisMhOM/j1qVm1uLgFv2nt7jUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0HXdSKza; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902B5C4CEF1;
	Fri, 23 Jan 2026 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769185995;
	bh=oB1+aXy1aHIBlEeyxJ/8eYXFpwaSpcpm9225Hgu7V3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0HXdSKzaloqHnbd9G5p/WXZ2QZK8PA03U/a0GerbUaVVVPayHva/y+eiYs/gPMqoL
	 R4FHVwWDR5OaHcTxYUQOy/ujyuPT2akGLQEyQAO59kraWn8htt7y+HiopAu0+14Hiq
	 R2qQiEbEOVOQF4eT33GevCN5F6OBymNuMZQ9B4vU=
Date: Fri, 23 Jan 2026 17:33:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <2026012340-wildlife-scratch-1efd@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2799-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 823CE788CE
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:24:33AM -0500, James Bottomley wrote:
> On Fri, 2026-01-23 at 10:29 +0100, Greg KH wrote:
> > On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-König wrote:
> > > Hello Konstantin,
> > > 
> > > On 12/10/25 05:48, Konstantin Ryabitsev wrote:
> > > > ## Web of Trust work
> > > > 
> > > > There is an ongoing work to replace our home-grown web of trust
> > > > solution (that does work but has important bottlenecks and
> > > > scaling limitations) with something both more distributed and
> > > > easier to maintain. We're working with OpenSSF to design the
> > > > framework and I hope to present it to the community in the next
> > > > few months.
> > > 
> > > the current home-grown solution is
> > > https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/, right?
> > > 
> > > I wonder what the bottlenecks and scaling limitations are that you
> > > mention.
> > > 
> > > Is there some info available already now about the path you (and
> > > OpenSSF) intend to propose?
> > 
> > There will be a presentation about this in February at a conference
> > and hopefully it will be made public then as the work is still
> > ongoing.
> 
> Could you please stop doing this?  The Open Source norm is to release
> early and often and long before you have stable code so you get
> feedback incorporated *before* you're committed to something.

I'm not doing anything here, sorry.

> You're making it very hard for those of us engaged in open source
> advocacy inside various companies because we seem to spend a lot of our
> time trying to get our engineers not to drop fully polished projects
> into the public view but engage early on prototypes.  It rather
> undermines our position if they can point to the Linux Foundation and
> say "but they do it so why shouldn't we?".

When there is something that is reviewable, it will be released as a
starting point for everyone to review and comment on, like any other
normal open source project.  It's as if you don't think we know how any
of this works...

Surely you don't want us to be touting a bunch of vaporware at this
point in time, right?

thanks,

greg k-h

