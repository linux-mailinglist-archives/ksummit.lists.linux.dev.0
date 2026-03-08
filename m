Return-Path: <ksummit+bounces-2892-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM/gCV5OrWkk1QEAu9opvQ
	(envelope-from <ksummit+bounces-2892-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 08 Mar 2026 11:24:30 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8791D22F510
	for <lists@lfdr.de>; Sun, 08 Mar 2026 11:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7443230104B7
	for <lists@lfdr.de>; Sun,  8 Mar 2026 10:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D9E36C0D5;
	Sun,  8 Mar 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r4/r+LKE"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386EB35BDB2
	for <ksummit@lists.linux.dev>; Sun,  8 Mar 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772965463; cv=none; b=UC3hwIRx1AvbYuic3Ntd4YNTKUobtXN/ZiwuhNsrYBS4F2fuauZW53a+bd1ZD2TlP5crcYkfgNHZpnuJlN8+PfudRbUg9PzfR2SiPlTRt7Xs+Vk//TBN9x0Xh+uL7+UUcZdmjugRpSQP4QjrOpUmEtt816qxa43qjFC16CFd7U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772965463; c=relaxed/simple;
	bh=yRRZRn26D+KM+1xZ6a2qrMxDJ02uPVT2R1D9iDoD8uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzeMl+MyaywqVMOBblHlNRn3rnR7KFwFsgXinAKMR7CP9oPerDyUp0Y5iZl+YoMz9s0/vM/I3VJ/8r6z1OrrhJjyJv4+DjscRvdQPAtsuGmuSnT+W98TRGNXmt4Kcrr1MgUPx51FEHwPL4wi7YxlL0upflezfS4n8EYer33YbY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r4/r+LKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAB0C116C6;
	Sun,  8 Mar 2026 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772965462;
	bh=yRRZRn26D+KM+1xZ6a2qrMxDJ02uPVT2R1D9iDoD8uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4/r+LKE5DX8C2Fs+3a0UAlnn7x/GX8fpnt3kuTs4fBCa670u3cL/3zWksga82E5y
	 ErV6T4jN5T7kFA8OSS2BeNV63szBIMqOGAepFiQs56mSuvChhdqPd8E0XJilH977CH
	 R8xD6JCisePVzIDMbT7drhFgimfz1jWfC2r1LNps=
Date: Sun, 8 Mar 2026 11:24:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <2026030838-kissing-liftoff-a634@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <3dd58b76-7461-4e8b-9dc6-a936a41d8faa@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dd58b76-7461-4e8b-9dc6-a936a41d8faa@kernel.org>
X-Rspamd-Queue-Id: 8791D22F510
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2892-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.228];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sched.com:url]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 08:21:12AM +0100, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On 1/23/26 10:29, Greg KH wrote:
> > On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-König wrote:
> >> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
> >>> ## Web of Trust work
> >>>
> >>> There is an ongoing work to replace our home-grown web of trust solution (that
> >>> does work but has important bottlenecks and scaling limitations) with
> >>> something both more distributed and easier to maintain. We're working with
> >>> OpenSSF to design the framework and I hope to present it to the community in
> >>> the next few months.
> >>
> >> the current home-grown solution is https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/, right?
> >>
> >> I wonder what the bottlenecks and scaling limitations are that you mention.
> >>
> >> Is there some info available already now about the path you (and OpenSSF) intend to propose?
> > 
> > There will be a presentation about this in February at a conference and
> > hopefully it will be made public then as the work is still ongoing.
> 
> The event was
> https://lfms26.sched.com/event/2ETT5/the-first-person-linux-kernel-maintainer-verification-project-greg-kroah-hartman-linux-kernel-maintainer-daniela-barbosa-lf-decentralized-trust-glenn-gore-affinidi
> , right?
> 
> I don't find a way to profit from what was presented there, do you know
> if there is video coverage? Or is there other material about the
> proposal?

Yes, the session was recorded, but no, I do not know where the video is
just yet, sorry.  And there was lots of links in the video and
presentation to the code repos, hopefully it will be uploaded soon...

thanks,

greg k-h

