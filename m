Return-Path: <ksummit+bounces-2894-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAOtC/bpt2mzWwEAu9opvQ
	(envelope-from <ksummit+bounces-2894-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 16 Mar 2026 12:31:02 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F7298B13
	for <lists@lfdr.de>; Mon, 16 Mar 2026 12:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCDDD3009524
	for <lists@lfdr.de>; Mon, 16 Mar 2026 11:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C8934F486;
	Mon, 16 Mar 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wZb7Y8TL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2902641FC
	for <ksummit@lists.linux.dev>; Mon, 16 Mar 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660512; cv=none; b=fRBSoPIldfxhGhfP81iMH1cc3EYNpeYxx9yLCpks1tayhb1pPXn7Gs9dY4tRljdrzrKWBrF9paeTWAKzCz19GngOh752cddT7NYSlIByAGkiF+jWoZXvyr4b9q0GOEEy7XGN+dJFHnk6Wm1cy1PWseniiHgMkxgGptnvSdMYaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660512; c=relaxed/simple;
	bh=B6jnfu17YMsr6ddyRJ8F967yX/dNNW+mJYvKUMl52sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjO9PwpbNjO1/fU4OxUZcPPU76TJjxUoSpgpzH+zxupigzQOsIeOM6SFEBtvxOrgn8vPAyjPeTiMVCty6pArilR/xSxarKrMGAp3PEF21bjXjakB2DXLkoEwRHz8o6qTtSvsB5wUY9ap063llvdGzwn4PvP00cTXvZL47EIz3CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wZb7Y8TL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5E9C19421;
	Mon, 16 Mar 2026 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773660512;
	bh=B6jnfu17YMsr6ddyRJ8F967yX/dNNW+mJYvKUMl52sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wZb7Y8TLbmqI7Kz0PycwAHhgacuJW7/HGepnxM53RRmgMxiHziR7qdGde/qxsRMPN
	 sWJZTqb0/SdBzL3L9SFAIbulQqq9Px+aY1opRpzTx1aOBtQFTPjpAiUDObZNbOSqxp
	 O0GSiTBYWylLJyVQciUudkUnhEwJ5MTB6+7LFMUg=
Date: Mon, 16 Mar 2026 12:28:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <2026031615-amusement-yam-d036@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
 <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
 <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at>
 <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com>
 <571171361.40507.1773586731470.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <571171361.40507.1773586731470.JavaMail.zimbra@nod.at>
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2894-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:url]
X-Rspamd-Queue-Id: B46F7298B13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 03:58:51PM +0100, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "Geert Uytterhoeven" <geert@linux-m68k.org>
> >> While traveling, I found some spare time to prototype my idea:
> >>
> >> https://git.infradead.org/~rw/kcontact/
> > 
> > [...]
> > 
> >> Currently, the lookup table is constructed from an x86_64 allmodconfig build.
> >> Having a combined table with other architectures is possible too.
> > 
> > Nice! I threw a few arm/arm64 crash logs I had lying around at it,
> > and the results looked good enough to be usable!
> 
> Due to bad weather here in Austria I found more time.
> I polished the web page added some notes on reporting bugs and
> published the source code of the tool which generated the JSON "database".
> 
> https://github.com/sigma-star/kbooboo/tree/master/datagen
> 
> I'm not sure how to progress.
> Is this something we want on kernel.org?
> Hosting is easy, all it needs is a static web server.

Why not have kernelci host it?

thanks,

greg k-h

