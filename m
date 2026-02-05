Return-Path: <ksummit+bounces-2832-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM9RMTLghGmi6AMAu9opvQ
	(envelope-from <ksummit+bounces-2832-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 05 Feb 2026 19:23:46 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A24F66C9
	for <lists@lfdr.de>; Thu, 05 Feb 2026 19:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2B930097E9
	for <lists@lfdr.de>; Thu,  5 Feb 2026 18:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB0830594E;
	Thu,  5 Feb 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chVF/rdO"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7412F3C3A
	for <ksummit@lists.linux.dev>; Thu,  5 Feb 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770315820; cv=none; b=RmuflI23YVxMompw/GCl+QbuzaQrLMYfiMvhecEeJp17gp2m/G7OabiUOIqAC+s32KrkHXD9PTYRo5Hm4wliImsX5aAIjgFnxSxMI/fwI4lu7wlRLl8iKyvlgAHY4uyN7vuqxdi08E8N+GUHMpW73YlS6AaTuScN27gU+F9BmyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770315820; c=relaxed/simple;
	bh=CeZLPYjLiHnHanctD8Bm9kzCKE+hwaCPanDKr+IOiHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om3jj3jtJix140oMkaDpft5YuwNGrbZSQVckIvSzvhl5p+/Fu65qYVPN1OCh4b0HTQjLrngZbyxPxYUGE4ED5xrnGGM7D+21tkHYOXgd+OATqS5+D3g0FT/dpVINDt0pBC5Cou1X5fXMq7D43yslntAozmvHCnb6vA9QijWo3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chVF/rdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA965C4CEF7;
	Thu,  5 Feb 2026 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770315820;
	bh=CeZLPYjLiHnHanctD8Bm9kzCKE+hwaCPanDKr+IOiHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chVF/rdOkjwqjpOCDpKNiB1107MQLLzzG2yJTdxlfhnBSjVszVAk72US++jgukhAL
	 V7nuDhOXrpNwCS1O0xEbJsR625xblNIFurM8P57xCbdoRo94lEZWp2at037Md3phBp
	 6ORn6d0tfibX7K5Nj4FYl8PdkM8f4abnUFb+Q9vEv5M2ByoiD8fECfndVKr1N596FW
	 V3MM+36H4Er1cboKwjblkUBMoNaSt1F6cof2giz8K7ZsNQnqw/zItlYXOWC5oPtXy/
	 j1dGf6Jp3iHko2Xlfbr54f6QNs172D47h7TEz5jhiAYZJwDwopKKNQLP1iv5Q9kB5h
	 uzTJfvpRoaxUA==
Date: Thu, 5 Feb 2026 13:23:38 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev, "Neal H. Walfield" <neal@walfield.org>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260205-yellow-jaguarundi-of-enthusiasm-6bbe20@lemur>
References: <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
 <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
 <2ef60fa3afe287cec92020b8b77a37c0b70cefaa.camel@HansenPartnership.com>
 <4ilnblmm3srkyzq7o5ehlr2gnlrrnmr67dpoqxiy5vbrrqlqd5@my3rxybcpu5t>
 <CAHk-=whoJY_pORG8M_K5kSA-x0+MwRa5wHwkHY4sbYbPFegc_g@mail.gmail.com>
 <2nvtfc5plg2i77hbv7jpco7q5kyym53dwume67vd3c6yvcmsyc@uaybcsxhnqjw>
 <7289c75f84bf43ad939b1899d2b251977c30359e.camel@HansenPartnership.com>
 <2biipobzkforfbvidexqhz5zoqduyl4wkqx6sg4ubrhqdatrgp@dx3gxqgiy5bx>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2biipobzkforfbvidexqhz5zoqduyl4wkqx6sg4ubrhqdatrgp@dx3gxqgiy5bx>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2832-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mricon@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21A24F66C9
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 07:07:30PM +0100, Uwe Kleine-König wrote:
> But let me note that it's not you who maintains the kernel.org
> infrastructure and thus you don't have a strong interest to disable
> accounts of people who are MIA.

We already have a way to disable accounts for people who are MIA -- we check
which ssh keys haven't been used in over a year and automatically disable
them. This still leaves email aliases working, but removes the most critical
level of access.

-K

