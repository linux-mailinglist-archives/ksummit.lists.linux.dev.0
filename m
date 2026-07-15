Return-Path: <ksummit+bounces-2967-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eJhVAOcPV2odEwEAu9opvQ
	(envelope-from <ksummit+bounces-2967-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 15 Jul 2026 06:43:19 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9375A7FE
	for <lists@lfdr.de>; Wed, 15 Jul 2026 06:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kroah.com header.s=fm2 header.b=VvpT1wdM;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=D7uzWUZV;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2967-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2967-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=kroah.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C4E7300CEB6
	for <lists@lfdr.de>; Wed, 15 Jul 2026 04:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA4C3B42D7;
	Wed, 15 Jul 2026 04:43:14 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9713777E
	for <ksummit@lists.linux.dev>; Wed, 15 Jul 2026 04:43:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784090593; cv=none; b=uxs2um4WyiGKsNgT1mLzGuKoN1pP5nTg3uWXBaEbI3uLuMF5wgImwEP7mLMg2ksbH5uzFVPdWOd+wi1iTRHYd65cKiP2SHGvf+eQlm82zAeo1SrYClUWBOezj+bdQvbzHGyUq5E3fsyezgPCrCBeXTv1m851lTU0UkmY7QC5TRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784090593; c=relaxed/simple;
	bh=4sIsq6nYBqPZRi04ZUCpy9Rx4ckdXNzLhaFJw+j/acc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIiEbjjME+NddiTaWFbHqzKQy+f0pS1iDdjgzQ8Kx+Oj9AhBVZ9+T+e1/e4UYA7K5cBYpbetWpPMjcdOVDsr7mrQEgODwlHxEu8DzIWVhIN5yni1dhhJ3fUbB4uzn1MtD3EihsUpGQJvmRdQWCF7WgKSoCx/6lphQKAokEIWbIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=VvpT1wdM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D7uzWUZV; arc=none smtp.client-ip=103.168.172.157
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B3281400134;
	Wed, 15 Jul 2026 00:43:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 00:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784090590; x=1784176990; bh=PS/3AP3BE/
	YzSAinhSlwzANmbGPK3lJOwmYG4UkhFAk=; b=VvpT1wdM0PlxkxRVBcT/0RV5bJ
	9pYN7mb13PLpnES9fXVV7ZGivPHh3jUwW93krqqZmbWk9RL9DHl44qeljSiQgCw5
	8Nd2qBx2vh03xgTbtKcsg/QPO1+69rB06tpYZl3Fd3jLRbQzDN07nZ9PyNc+Cyji
	byCk2oCWrq/TcfP/tIhrEWhxDiH1Wmhd+pUsnzknzMXW8GeolLeU7lEdpMfwozqI
	chR7QZGYXHAsXM3KLJ+AZ3AJku2YOHTixRVpzrO1aiv2MytvZ3XLV0mgDggclLd3
	nzamRHW6+72CLkimwppPr9+hNhEbfTNqz0+afq9c7lb+taZ50B3ytbX8yXZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784090590; x=1784176990; bh=PS/3AP3BE/YzSAinhSlwzANmbGPK3lJOwmY
	G4UkhFAk=; b=D7uzWUZV3i1LeglEa0DLiTLNe6Uz8ewYSg+wnvZqcQHaII4cw0G
	SWDlO3A/IQajbwQuatWgsx9H7ipMj+CkmbWOvPe/tI6+J2GubzxDiwTJa3ZI4rjH
	jLc+msK6gwYUjI8pW5lUS6uYd9frdaFtDdaC/0tqOvhdvlla7A0xdNU78ZIJmlMU
	hozqzYfrdHz+RB6OfWu6ci4gaqHCEkx2qcU75KJndelYku3n78LjwXj+VyRR51Hk
	ls0RYU5t8PYK7mL/6+8s1gdmS+q6t52F1s7BUZI+bhx+yzNU4vYg3d4FLLyufOLh
	N+Zb5p91deUJ1V8HmZKLCHvonpJq5k06G/A==
X-ME-Sender: <xms:3g9Xag5zsCrubRkzgkF4gP-keN4LK8BG0Cs3xEMAupCtwX1MiMCGzw>
    <xme:3g9Xavueh8Kfar8m9Vx_lBuNstWPYkdpq34Ho-6rvu0MQmu4n_oOr7RxrtVxpNGS-
    RTOKbEwODCnZb1MyIJyv6oi0nMX0PW55EBvEb_e9q6EvQmHIM4>
X-ME-Received: <xmr:3g9Xap5oOZP_vJFpGstjm1Q8YNkwhVvdVLC5IsnGAj_R87N3gLpGpXfZ7jbWN-AbCHrBxAqUAu59E-XVA1-_93-PWQ>
X-ME-Proxy-Cause: dmFkZTEFiyjhWX5bEydgjbZMpeie9dfLoYBUcU2gnFX/PfhuXL+Dwup2cS3MWpMIlaylbC
    TkjOIXyqVZSneeBX/m7X2DESbKoQ0ZBTNq4yAAOR/5kuHz4g8lh0PcIDrznvLEhnHczZQU
    +kRSaME5JrcX1bN/033RjIcVm3MJJoh1Q7csHjJMw8ei1m1vsUSY7AcC88nfcS7gcjQfL7
    fpg1GOWTzH6pLuvJe6dQNePs7Qb/RNPd4/caoBQidZYlzorUCPqkALudx9mItKLpFF5RzR
    RoiCY9/M3rLxwrfebT6Oc6qcORzB1TdyIBeX2FBk6KOUkweQWp8GOsKZfwFpLBYyLe+IIb
    UJHCxfjqd2r3mUxkFwYhnhssEe6GZmMF+8/XdHf9grExLAMRd8qKdD2yz7XEDbNJK/9vIi
    yd1V07kwK9TUmkEM7/COodTMeAbqRtRyLPKLUHkXrRjb2XnJB4igrx3WhIClsYvwhemDAa
    8Dl148PvAX2VG38Eyf4V9ODDZTuLTOU9sQ3d8wvd/c1l0Ezm0U6v4qhCiA5r/45jWPGd3m
    CLel9KbHLmcXSkK6NZy2yz6sz+gnxz+4sHu5XC3QSkdPBo6xcuUapjuPs6hN5XUOR6TYdT
    lATvw30PW0nZ4+SVYJeU8nJtkFCQt0Sj1PFTPV7EWBQnT7w7JxX1G0Ss+COQ
X-ME-Proxy: <xmx:3g9XaiXNrQfop-363mAMGIcccjivtzsF3OuguQOSPvTRge5cJy2S8Q>
    <xmx:3g9Xaj-qVifmTP9xBBX6v1qDzqkKYZTbJ6RdulVavaie3dVVM-VeMw>
    <xmx:3g9Xamn9G0zBPqerxhKwnk_ufmncYN_i1E1Cf79UlU6rCrITzJzByA>
    <xmx:3g9XapXOddvuFEimqr8Uzhca23Y6Lq1B5dMzsSEw2PBCtlxyoFy-xw>
    <xmx:3g9Xah3oliQR595G0wuOd3Pqbkva2qE3TBHPx6kQsoWuU527Uo-zGptm>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 00:43:09 -0400 (EDT)
Date: Wed, 15 Jul 2026 06:43:04 +0200
From: Greg KH <greg@kroah.com>
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Scaling our security process
Message-ID: <2026071553-tuition-hatchery-4588@gregkh>
References: <albMUqack9yMq0rF@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <albMUqack9yMq0rF@laps>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2967-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:from_smtp,kroah.com:from_mime,kroah.com:dkim,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFD9375A7FE

One comment about something I've been working on lately:

On Tue, Jul 14, 2026 at 07:54:58PM -0400, Sasha Levin wrote:
> 1. Does security@ still work? It was built for a handful of carefully written
> reports, handled start to finish by a small group of volunteers. That process
> never really scaled before, and it won't scale now. Does it make sense to
> separate the roles? let AI driven tooling handle intake, filtering, and
> reproduction, and keep the humans for developing and coordinating fixes for
> reports that survive triage?

It was not really "built" for anything other than a place that people
could report security bugs and get them fixed.  We have changed the way
it works over the past months, and for right now, things seem _MUCH_
smoother than ever before.

Also, we are getting funding "any day now" to have someone work full
time on this, to be the "point person" for the alias to help when things
fall through the cracks, as sometimes happens.  We have verbal
guarantees of at least 6 months funding, and if that goes well, it
should be extended.

LLMs really can't be used for security@ EXCEPT if you use a local model,
due to the "interesting" legal rules that security@ has to operate
under.  We've been using it there for a while now, when needed, and it
has helped to spit out "first cut" patches for reports that do not
contain a patch to start with.  That usage is gone way down now that we
ask for a patch in the intial report as all of these reports are being
generated by a LLM anyway.

And attempting to use a LLM to handle intake and filtering just doesn't
work.  Many people who have experience with being on the recieving end
of such a feed have agreed, that isn't the real problem with getting
this feed at all.  The real problem is unresponsive reporters, and
"middlemen" that like to put their company inbetween the reporter of the
bug, and us, the fixer of the bug.  A LLM just can't do anything there,
but I'll let the person who ends up doing the work for this for the next
6 months have their say after they've been on the recieving end of the
firehose for a while :)

thanks,

greg k-h

