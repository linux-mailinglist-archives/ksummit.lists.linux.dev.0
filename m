Return-Path: <ksummit+bounces-2795-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKYlKFBqc2l9vgAAu9opvQ
	(envelope-from <ksummit+bounces-2795-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 13:32:16 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D527575D76
	for <lists@lfdr.de>; Fri, 23 Jan 2026 13:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C01FD305EFD9
	for <lists@lfdr.de>; Fri, 23 Jan 2026 12:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF95C340290;
	Fri, 23 Jan 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AzbxVePw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5859E2D6E76
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171385; cv=none; b=NxR5l6WyAxUh3sKdZofCJTjpP6YaP0SdZX1W3Ou35GgPGqyWbUd5QpiyQvRdiNGnEkZoDflWN3ofinzAQ0q9KzXu+z/rEwItUMiCOxDkLkfvar8Q+HWHbteUCgba5b4XinnX6+OxMIMostSVmd5bJpXKMnebpC4cekgy+JmCKoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171385; c=relaxed/simple;
	bh=uqqzsE9E8TeS3aizrY5y6ucE/iwGo+gVpCFBWtga0YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlBmXsoshleQd/Dv1DoStjS7K5xqsK7QXjdmQjWMtCjBtGkP+oCVrk4soTd+WtHEZe+Ufq2rVd04WFwe+43YWyh8EPK/mU243TeyBklDknS9eM9LXFC6reTaY/nbB1DcgTPiZKi86Br7xdC1PLSFDZyzuzUIM80lNKYoB8Qqh3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AzbxVePw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933F5C4CEF1;
	Fri, 23 Jan 2026 12:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769171385;
	bh=uqqzsE9E8TeS3aizrY5y6ucE/iwGo+gVpCFBWtga0YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzbxVePwjvv1o8e4EF/2uR2OM8h/5mnUVkUatDALRkkYvP4wY6Dk7p7xe2/cuqfTK
	 PHQlpQMSro2EMe7OiWA5jcVjGLJFd8jPrmLmvPcYf9qP/V1OyALagbt6vfNs0W7MNo
	 Xy76L4WRJPe7hMA2gwe6gSRhUmZgI8RoYFbsNg+E=
Date: Fri, 23 Jan 2026 13:29:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <2026012314-repressed-chummy-635d@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <20260123124700.0ab2a954@foz.lan>
 <2026012320-tiptoeing-backspace-241b@gregkh>
 <20260123132449.3f8a01dd@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123132449.3f8a01dd@foz.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2795-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: D527575D76
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 01:24:49PM +0100, Mauro Carvalho Chehab wrote:
> On Fri, 23 Jan 2026 12:58:48 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Fri, Jan 23, 2026 at 12:47:00PM +0100, Mauro Carvalho Chehab wrote:
> > > On Fri, 23 Jan 2026 10:29:28 +0100
> > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > >   
> > > > On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-König wrote:  
> > > > > Hello Konstantin,
> > > > > 
> > > > > On 12/10/25 05:48, Konstantin Ryabitsev wrote:    
> > > > > > ## Web of Trust work
> > > > > > 
> > > > > > There is an ongoing work to replace our home-grown web of trust solution (that
> > > > > > does work but has important bottlenecks and scaling limitations) with
> > > > > > something both more distributed and easier to maintain. We're working with
> > > > > > OpenSSF to design the framework and I hope to present it to the community in
> > > > > > the next few months.    
> > > > > 
> > > > > the current home-grown solution is https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/, right?
> > > > > 
> > > > > I wonder what the bottlenecks and scaling limitations are that you mention.
> > > > > 
> > > > > Is there some info available already now about the path you (and OpenSSF) intend to propose?    
> > > > 
> > > > There will be a presentation about this in February at a conference and
> > > > hopefully it will be made public then as the work is still ongoing.  
> > > 
> > > I got curious when I saw something about "First Person credentials"
> > > at https://lfms26.sched.com/event/2ETT5?iframe=no that 
> > > "would begin with the Linux Kernel project" - and more importantly
> > > how and when it would affect my duties. I guess I'd need to
> > > refrain my curiosity until the end of Feb :-)  
> > 
> > Ideally it will not affect anything, just replace the use of gpg however
> > you use it today for kernel work.
> 
> I suspect that, at some point, we'll need to setup our new
> credentials somehow - hopefully without needing to be physically 
> present on a gpg-like key party. If we can do that using our
> existing infra or our current gpg keys, the replacement should be 
> easy.

Yes, we will have to "recreate" the web-of-trust somehow.  That's part
of their proposal, for how to do that and maintain it over time.

thanks,

greg k-h

