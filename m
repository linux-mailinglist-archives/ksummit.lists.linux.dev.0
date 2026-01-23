Return-Path: <ksummit+bounces-2791-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK6sBeQ/c2mWtwAAu9opvQ
	(envelope-from <ksummit+bounces-2791-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 10:31:16 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D5735DC
	for <lists@lfdr.de>; Fri, 23 Jan 2026 10:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C4C2304B01C
	for <lists@lfdr.de>; Fri, 23 Jan 2026 09:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC7D366817;
	Fri, 23 Jan 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d1TYaWgA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B578523EAA3
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160572; cv=none; b=UHj3WUgKWUTouHJd8jn6oy8uU9wXYtebSabb4ESRXIKJP5FAIili/B8b4KILtjBQLfxtbwMHNabxgKY1UoSgZel+0cgOcCFpvQaNMUtgfpZ/KflaNbM6ot5SeBAXnCJHaJxdYv98jklN1l032qwRNX5qk0ptVBLJk9gHK77HzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160572; c=relaxed/simple;
	bh=w8X/jidkqemvuNJKXW7L9A5PFZf9bDNonoiVWlyL5OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKgfyotJVvCV2sdRslafnf5xEVC1/UZX6X13SVrDqYL0REhCeCmc02FcOlskIQim7RjkfnGjQtAIL15BlTLD8+x/Ui0QAqoVPTnZ48SjCpwbXsmDv9s5Rd7pFyv8drPBLcbjfMzdpg4EmVF8FJWvrz9buV6Op+H6AFbaj5maPtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d1TYaWgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4D0C116D0;
	Fri, 23 Jan 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769160572;
	bh=w8X/jidkqemvuNJKXW7L9A5PFZf9bDNonoiVWlyL5OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1TYaWgAGrmI5T0mdovj+YRzX8B8fjPUJ/c4uzZsDRV3mmSrtxegY0XdQqn3xgO6Y
	 YViyIIuVhhEGAQpSxruAJeo6UaJYkKwpZNJ1rvwmfztYMEPfxj+xTBHukF3zaSyT9i
	 b87Xjd8ylpW/QcCsTGTvZ/eRsHlCv7WACFBfWUG0=
Date: Fri, 23 Jan 2026 10:29:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <2026012340-cannot-spud-5d46@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-2791-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 900D5735DC
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-König wrote:
> Hello Konstantin,
> 
> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
> > ## Web of Trust work
> > 
> > There is an ongoing work to replace our home-grown web of trust solution (that
> > does work but has important bottlenecks and scaling limitations) with
> > something both more distributed and easier to maintain. We're working with
> > OpenSSF to design the framework and I hope to present it to the community in
> > the next few months.
> 
> the current home-grown solution is https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/, right?
> 
> I wonder what the bottlenecks and scaling limitations are that you mention.
> 
> Is there some info available already now about the path you (and OpenSSF) intend to propose?

There will be a presentation about this in February at a conference and
hopefully it will be made public then as the work is still ongoing.

thanks,

greg k-h

