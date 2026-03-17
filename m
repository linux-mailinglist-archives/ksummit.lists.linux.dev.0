Return-Path: <ksummit+bounces-2896-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDqGK7kIuWm+nQEAu9opvQ
	(envelope-from <ksummit+bounces-2896-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 17 Mar 2026 08:54:33 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA212A5246
	for <lists@lfdr.de>; Tue, 17 Mar 2026 08:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 818043036753
	for <lists@lfdr.de>; Tue, 17 Mar 2026 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189C1391849;
	Tue, 17 Mar 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rtMyRNZY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF08192D97
	for <ksummit@lists.linux.dev>; Tue, 17 Mar 2026 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733868; cv=none; b=Mt1TbSQ7hHO2xEkGSMH3zTAgtPc2O5D3DVzrUhfswKoAEiFQEGIO562/kIFc8iAk4BOseGmKOjOXy1GNyEqrB6R+vQhN48LuQ8kgI36hiuAkIm2yF6HxEVNV0LwT1eESFTdMrLsJWUaNVl2Ti/zr1e4PXCFc7RaZ8BYcWLyLIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733868; c=relaxed/simple;
	bh=VQOuwhEtLzHEY1C7LlONnYPk+gDaCuefsotr4p0cNZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsAzukhQntFSoVgO6HuShD2X/r9HPgGXh39nEdWZAmsLCF7/JodCSiEigVI+s5xvZgvX/1TfsiK9ofDDSKRlVY4XvLK8xUrj/rm3knuEsiHa8tcyT2POxgKnR3ISGU8zMaFK3HLiYJAGR0lDmEonVjuzpokuGDzhzmkGeEPJC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rtMyRNZY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E63C4CEF7;
	Tue, 17 Mar 2026 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773733868;
	bh=VQOuwhEtLzHEY1C7LlONnYPk+gDaCuefsotr4p0cNZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtMyRNZYj5UBNVT6Dsyb0Xf6j9yyiCgXbK7G4Pyzg7eiQyovupN+j2nk2iPD/e/f3
	 9ih1rOzWkzVlM0pUzWrBl4PspyrcHF+5njqPOb1HnLDgdBAymRJhzKe/CQ0OYxiSiV
	 HP3yUIWq7hzfCNeEt0vhLcydG57lxIfYaKYdLTwk=
Date: Tue, 17 Mar 2026 08:51:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <2026031746-rarity-acutely-2eaf@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
 <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at>
 <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com>
 <571171361.40507.1773586731470.JavaMail.zimbra@nod.at>
 <2026031615-amusement-yam-d036@gregkh>
 <1440843008.46131.1773698213099.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1440843008.46131.1773698213099.JavaMail.zimbra@nod.at>
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2896-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nod.at:email,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 2AA212A5246
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:56:53PM +0100, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> > An: "richard" <richard@nod.at>
> >> > Nice! I threw a few arm/arm64 crash logs I had lying around at it,
> >> > and the results looked good enough to be usable!
> >> 
> >> Due to bad weather here in Austria I found more time.
> >> I polished the web page added some notes on reporting bugs and
> >> published the source code of the tool which generated the JSON "database".
> >> 
> >> https://github.com/sigma-star/kbooboo/tree/master/datagen
> >> 
> >> I'm not sure how to progress.
> >> Is this something we want on kernel.org?
> >> Hosting is easy, all it needs is a static web server.
> > 
> > Why not have kernelci host it?
> 
> Do you mean the data generation tool or the frontend?
> For the data generation tool kernelci makes a lot of sense,
> they should have enough versatile kernel builds to compute data file.
> 
> For the frontend I don't care much. It should be some location potential
> bug reporters can find.

I would recommend both, but have no idea how to do so, sorry.

greg k-h

