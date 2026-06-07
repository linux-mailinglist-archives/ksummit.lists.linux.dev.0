Return-Path: <ksummit+bounces-2923-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A3pMM7kqJWqkEAIAu9opvQ
	(envelope-from <ksummit+bounces-2923-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 07 Jun 2026 10:24:25 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4C364F204
	for <lists@lfdr.de>; Sun, 07 Jun 2026 10:24:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=packett.cool header.s=key1 header.b="nu5IFFY/";
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2923-lists=lfdr.de@lists.linux.dev" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2923-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=packett.cool;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1C0B3012CB2
	for <lists@lfdr.de>; Sun,  7 Jun 2026 08:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C7836EAAB;
	Sun,  7 Jun 2026 08:24:23 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB725771
	for <ksummit@lists.linux.dev>; Sun,  7 Jun 2026 08:24:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780820662; cv=none; b=obV0pAtE1ZOCNQiszsAxg+kA5x2pOQ24Rfohn1U/5or9JHjOBreN1QG3+g8Hn26dNeRAQ0xRCEYA1vQW8yKjqQRA3TT5YqVcU7vY6ywlu7JlA8a7a08DSao11RUP+sYeiqFAF+NkoUPCRXEpjyKTG8/3doPBLsd6AdyGuvi81qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780820662; c=relaxed/simple;
	bh=suR75xXkCWxXu1U7VmhlBbEdwkUcm00X79TqI5UF+jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxUoIsKp2hfKMApVvVXA8CaqMsW6qP2KGSG5+erUFpNb2oQ1VPVH5nnZW+s25iHMJgJtH1TGI+9dFZEdshbmzcMkDBd0W4gcnmy5DyoNqKjRRxFp9/rocNn9afkr2uUHoV0+ds9XXhlqhe+ZklqVgTTLl93Bx2Cke5dGQ/QuMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=nu5IFFY/; arc=none smtp.client-ip=95.215.58.173
Message-ID: <ad207e02-2498-466a-8aae-c2297755dbc9@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780820657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBZ4JdVCxQvuutKXNswAFYxB/ZbeVAVRB++V5H7cCbA=;
	b=nu5IFFY/UeLxjJ0QJKwth5xpKLN0/QGcUjgI6P9yIK5FXws53I19p4HpkMn2QaHnbPXVK+
	KV8ZfykLVz8/v3MyITXtMLQXlgBN4fyMWwpQPbcaXprrnmbCJxGIvLlnL0H3SwWLJVs4tX
	8zTLo2MX5TwBfxErQUv1VQSzbRcdVU7l47WwSx/qf+qc9eO3X1TELhOHf4HdT2lHoVnEvR
	otE7Bx/Uno1m+yMXNbK0q58/R0t+OUfmrbDrbK3n/tkYD0McwtdhotMHVxX8Vp0e5/Jvcu
	npIZ0BdhqWj74uKz3G9tOtdm8B6w0X4U5XXxSRTnbyEuziIqSuyvAGTaoyhKEg==
Date: Sun, 7 Jun 2026 05:24:03 -0300
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern
 age
To: Neil Armstrong <neil.armstrong@linaro.org>, ksummit@lists.linux.dev
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard
 <mripard@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2923-lists=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D4C364F204

On 5/26/26 4:41 AM, Neil Armstrong wrote:

> Hi,
>
> Since the introduction of the first Samsung DSI panel, the Linux DRM 
> panel
> API has been a crucial piece of software for enabling displays across
> diverse architectures, but it has not evolved alongside modern 
> graphics stacks.
> Currently, the API lacks atomic DRM API support and the ability to adapt
> power setups during mode changes.
> Furthermore, it fails to support advanced Display Driver IC (DDIC) 
> features
> that modern hardware heavily relies on, including:
> - Standby and advanced power states
> - Advanced color management
> - Dynamic rate switching

Yeah, support for *multiple modes at all* is pretty much absent in 
practice because panels tend to require configuration register writes 
over DCS when switching modes and the current API provides no way to 
make prepare/etc. sequences mode-dependent…

I have tried to make the CRTC accessible in order to be able to access 
the mode from prepare():

https://lore.kernel.org/all/20260425001130.233935-1-val@packett.cool/

But my attempt to refactor that again to go through connector_state (in 
response to the review) got stuck in NULL dereference hell so far…

> - Command mode self-refresh
>
> This lack of evolution has led to severe fragmentation between upstream
> and vendor downstream trees for advanced devices support, creating a 
> heavy
> maintenance burden and making native hardware support incredibly 
> difficult.
>
> The goal would be to outline these architectural limitations and 
> trigger a
> discussion on how to collaboratively modernize the panel API.
> By standardizing advanced DDIC capabilities and fully embracing the 
> atomic DRM API,
> we hope to establish a unified path forward for the entire Linux 
> community. 

Happy to hear about this effort. This is massively important for 
everyone running mainline on phones.


Thanks,
~val


