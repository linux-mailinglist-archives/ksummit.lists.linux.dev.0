Return-Path: <ksummit+bounces-2953-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o1WVIT7fT2oOpgIAu9opvQ
	(envelope-from <ksummit+bounces-2953-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:49:50 +0200
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989C733F9B
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:49:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Qk0ycMrS;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2953-lists=lfdr.de@lists.linux.dev" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2953-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3840308870F
	for <lists@lfdr.de>; Thu,  9 Jul 2026 17:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4734195C2;
	Thu,  9 Jul 2026 17:41:10 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C134195A8
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 17:41:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618870; cv=pass; b=k+LnaMEL14WjYENeOmqAr3o9vnD/JeJULXCtsGXaJr3ow3nXxe3sY4+X3+WGE81ZJIm6pxjJk4ZrA/KpGla9jIdA0u8mQRT3Ma/bcyPSl1D5maVhkJd4lXQ2o7mBB4vvPnD/USehw7TROi88JeSLk5nMV6YSAbm96MgQmjpXpqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618870; c=relaxed/simple;
	bh=6BoerezV8C7htukeOXMMiV98AYcshjNetiu1stMmpwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhNtZwGr8VlXDoU5NraQLdhJP3Y8xedTd+4O/Jo3VHLW26vhRwsFbK9Sr1eD36FmfmN6kzbpsTSTKfo1XROq5hFAiy/NozYVHNwYlSaXazeEJFzk1l1+G8Q2PyKukfzQM/7OGQj9pe17VjZuAyFwL9Jq9FpcUF37HzW4Fpesjrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk0ycMrS; arc=pass smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so38897a91.0
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 10:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783618868; cv=none;
        d=google.com; s=arc-20260327;
        b=ZH/A98jFRbs0dlO+uBLCblRJ42Y4vP79HbijorMh1LNLyo+p1SEF1YOdS6RhkmZXac
         MmzaPw8P0DiGVLG6b7evKeyuwi2GhODi+SjE5WNbBW+zU0W6NlS5aUWXLecNwYzCiXy/
         aEnbNX0flPQ6HIhnHjyJ11psHSmNVhYu7se9ljJ8w1GAueNtfiAzPk5UsMK/DWzYh3/j
         UrkpW+hHmTc/4FOOhajzhrOC8b9kIFtv+69HzI3qXTUrrTm+7PPKGRX5dL2YH05nQPV+
         xKGGHwdFXYuoGEw4zsJJbe+uCFg03QFl2pYz8rMTKEiWS7C6NwUPiENaDt0EEqNVt5Lo
         gAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ORVEEUE5hlslbvMlBF8cYsXtop2ZgTrTecOHQOSZB8=;
        fh=N+DuLLOHHZhFNmt/374smg9mpOuO1/7eUf6uDpapc+M=;
        b=anJlEC6kJa7s84FsRVNPBfDO+XfOSG+NWCfkMSnxJcVNGQjEfjhp9Poj6+qB4NfJFL
         kF8TpkahrRghLzj6tRNc6MrnhBOKNcPmZmQfOrqRqhq1TSLCZpDckESuo2H8buUkhkNw
         xVMrRlyBY6R4QydPM1vK/exq051yQp7x8IjV6Nff0MBcXX7TSv2YkYXi3EhXp5WE7sHA
         iIN2vZFg5YsFF6MINs/Yb86oytDfjuHQnm1HMBTzlB9BQpaqvvHqN2SGWPheKwcBVC3p
         fOERiBW7JDqfZqLKXQdBV6Q6tpY3fcmUW/Spiuo6JJz35hRExV4LijvOGs65oqhwQ6j4
         /XRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783618868; x=1784223668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ORVEEUE5hlslbvMlBF8cYsXtop2ZgTrTecOHQOSZB8=;
        b=Qk0ycMrSq7C4gNSa1JXkpTjyxaNd/3LMX4hbcP2GeVUQJqFUGFnVCc8GTYSB+fD4ko
         0LMnQycBhcB3oa9rpbGE4uiTfn9XiozX7Lif2yJ4iVJ4jkJxHW7QfFW0NEHBaDhLcUVZ
         wZ/x66TDKRjT15561Q8w7s84oJ7/c/OOQZGgxruJltbj/MPsQDq1z0kIP0gHMQ+OUqEQ
         00h1iPqNqstY56FWLA2Pz13H4ax2V2e+yoz0Qd323oP6I0a/5ihFaD732rl0vA4cAxLC
         /SswyeISMIiTww/W8rh/xQJbK03n+9ISZPoLL63MC/0rtCtPgPPrO0UqwDZ8UitdESwG
         zOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618868; x=1784223668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ORVEEUE5hlslbvMlBF8cYsXtop2ZgTrTecOHQOSZB8=;
        b=DVkpQrRqJnGPmbjdaTgqHmHqAnRgQzXbKSjdyUh1OfAzj9EgF15VwpQhxyGkBjobij
         x+4NuwqwPIr604r1zYSHubqd5DHfr/HFKvIiUZ5CQ5dxtwMnoDbZGm+orC3dkt25sdNt
         s76Srg1Hhps7MzulCQNwtM4vUwwUMRDzumzAw492JaigsG2UbIwFGLN1Zq7FeWLjoP0S
         xjslgc5t7mmrXY8r1vez6jTjV7Q557y9Ij814mhVfaH/Lu4HoYDlhQB3BY0Np+EzsSux
         9mWjytFld0bz3JwTeoAujdKxGlo66GxVvVXmka3e/IY8MYN6DEq0dsJgMIRPqr/g+YU0
         nhdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9oT0swMtk0P14sRWprkhTG+rosE9xcz5uIaTykxyrkqQk5yRZP8F/wiaKr6XnBadtrCHPPfkf@lists.linux.dev
X-Gm-Message-State: AOJu0YzWgfYDccEYK1UJbm/xnR2SO0+h0xf8rTcFKwbAoLFJ/06g9ts7
	+DBw7uHmu4kMbmDfcIb5hHWuD1Ck4o5X2+3Zvj8zXtxlDpyuNPUTLWo8FJQ0WmZVqLnvUUqd9i5
	MZw6KnGN3D/rptu73cO1lL25AO012Wpo=
X-Gm-Gg: AfdE7cnU9LgzuUPLnv37NnIBnI/D4GE5G3qqW4p+AO1pgVuclF+zgiCPZDalIwkJVLO
	tODpPW2Vrpw/eu2rK8QoR3MkNiM6msx5lcAqqxX7prUnX62W2fIOgabzGBt8aJFRqPYCZwB/mwQ
	Ryf3xcAfcQ/t0V56TdGv08GnOdXiP4JlB88XVb+wQ6mQNavcdNVMdrNxZbbGB60f8hPDZisJyHP
	r13UPl3VaKjgyIr3Oo1m0sCn9dZMMxyhI/SpFVQmQem/IibrWtCw8C0S/GUpxulHeXyfYleu1+U
	GhHcrAKbuM14V/yTnTyCOLuVsRuiCV9ZVx/WSpz+ed2854K0Qw1SYL6S7gMTpU8LlW1AAdjBAKV
	lL5hbak65Pha0DDhClkzL43Q=
X-Received: by 2002:a17:90b:58e6:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38a2170a4acmr4351523a91.7.1783618868411; Thu, 09 Jul 2026
 10:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org>
In-Reply-To: <ak_WOfpcaZIuh99t@casper.infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 19:40:55 +0200
X-Gm-Features: AUfX_mxQSr4PyGpetLCtfFcvd8ENbtSRZ87t7S47n2yq63GA6yMmASMYeu1Fh-w
Message-ID: <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: Matthew Wilcox <willy@infradead.org>
Cc: Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2953-lists=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,infradead.org:email,lists.linux.dev:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7989C733F9B

On Thu, Jul 9, 2026 at 7:13=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> What I really don't want to see is a whole pile of Rust changes to
> accommodate having to pass GFP flags to memory allocations.  Would that
> be a better vehicle for the discussion?

Currently we already pass the GFP flags and support different allocators.

For context, initially we used a vendored `alloc` crate, because we
were trying to see if upstream could give us what we needed.

Then in 2024 (v6.10) we were able to drop the vendored copy by using a
workaround by Wedson that allowed us to pass the GFP flags and avoided
our reliance on upstream's allocator unstable feature:

  b6a006e21b82 ("rust: alloc: introduce allocation flags")

Later that year (v6.13), we couldn't wait much more, so we ended up
implementing our own `alloc` module and allocator support on our side
by Danilo:

  b7a084ba4fbb ("rust: alloc: add `Allocator` trait")

Cc'ing rust-for-linux and Danilo.

Cheers,
Miguel

