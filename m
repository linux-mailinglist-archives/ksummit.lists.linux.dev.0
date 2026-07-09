Return-Path: <ksummit+bounces-2954-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sYRpFPHeT2rlpQIAu9opvQ
	(envelope-from <ksummit+bounces-2954-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:48:33 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FE733F58
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:48:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=awcrAS3L;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2954-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2954-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9286E301016B
	for <lists@lfdr.de>; Thu,  9 Jul 2026 17:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C044195C4;
	Thu,  9 Jul 2026 17:43:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2314195C2
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 17:43:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618993; cv=pass; b=PX9dCqf9LBBlelesdF8TfTZ1AxmQEXhQAYlBfVDo7XOK9R/guNPHTD/dWhmSKtzHTAjfDLSp/dvkCIkKrYiTYjPjXTbI1t7e28gW4+2ZWTvOaioF5JofUxyX3nski0BPQIXmrHJFsF3RJM1N2+PZsNbS2Msezyi9LItDd3XlgXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618993; c=relaxed/simple;
	bh=Wuxy3VYKNOQQHVdndA/SvYoe3iZbwJ6MdTo/lB2nmZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gom/cHV/OGyCGozCjvOBPZ4Vk/8fSqVFkvgQsmY3bVApjlYH973/uqfBVx4//Q5rYKpbcMFH1VrC/8ZtSM5ag9dgm4/i15JDH1jY93aQBECFJQIiifS/0hIQxQV3PMCb7fxFAQs6fgFPlhpnZWsDl2nFMSAQ06Dc2rTODAZPEOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awcrAS3L; arc=pass smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-384422b05b5so35207a91.2
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 10:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783618992; cv=none;
        d=google.com; s=arc-20260327;
        b=Sg0Vff0xeR3DJTSgEGlZvxrkC80mhVtxyyieEoZvOHi+jneLfufJ8z1Luj5juxrZ0h
         zkt6i+JLELWzBrLWc0FKC65UXa7qEPKUXul4w9Q0086fTlIEmrBVb6a1NyXdVfNObIy/
         9S2IJd0CQ5dQokZO/vOEw4wtTjKPzJTz1eHGKMHZPUQyqKNR6f+cXLfc6WPfg81TdTD4
         pSgbzVWJDcQqjo2VWATeM/eCI0/UJBxy6k2/1KJ0BksIgz4Tydvzyl1Z8mYKrqn30UJv
         yCbUQcVHkdWFVZPBC1pnU0lj+W6BjTYpVahSmqe9EmdBXB3OFR0Qgg6YVeGeTLpE4I+q
         W8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wuxy3VYKNOQQHVdndA/SvYoe3iZbwJ6MdTo/lB2nmZo=;
        fh=/kk7WyxME2XdGyimw0CkKOTnFaod/C8QcLILFmrZhys=;
        b=f1EA6ugtMVj9/GWLhpn/5usUt1uorl6LHxEGDczOzXz8MdHiXaBSuWP5s1Q6AZ2Api
         IdxVSyWAkVa2YWEqMO/lZ/8v4c8f+SQX2xZiqCXNpvawkKBnRWWxo1m7SBRJ8AMAsS6d
         uTQMc12myN4S6uKzJJJw945GmbjEa54oFLviUB/5xsvl7+Z2kK0qPi6iTQlJRiomf/Wq
         J4uZtzdPi0WSf8QRv+bFPPpX+fU1P4Yv21gfoNYJCtz7P8lrNvnkkdDm82HTTbRdOo+n
         MoPwh6IvUzjAEEFDnyexhNSIErx29yAYhZkE4g73JLzCRW1NyaIcc34wWKAaTTIUqG+g
         41Ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783618992; x=1784223792; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wuxy3VYKNOQQHVdndA/SvYoe3iZbwJ6MdTo/lB2nmZo=;
        b=awcrAS3LAq6Ro6DW/jTv5BlE6wSlogRY947xooUgM+F4YDi3NBKh9Ske9NbqWHArau
         x/m3ai415+0XxyOpok25iXCpaqYXJe8dty4ic+DIxsxMdjoISgsp/w5JuZijOK5Cvjo7
         QK5vjh9vW1lNeSpATGnXlV6sWOgSrrLdztisfLKETUqgzXz1dzMEnYyWLLGaQiogl58C
         X+5fQYQI2ZI7/wfxkN/UK0QltL3PV48TLJ9c/MG9GwZrEg5K0IzWqKhJXrfOTVDIVDVR
         /t487PAoB4C3e2Ug0RFh197wSXo+6JJwvYIDskLGVkrQunS70IGrRfdgiymksmyhaFH2
         2QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618992; x=1784223792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wuxy3VYKNOQQHVdndA/SvYoe3iZbwJ6MdTo/lB2nmZo=;
        b=Wo5aEn33mTjK0zegFlIiSRD+V9qJVtZmGg9DETDRdCaD/itsMuneeBrP4Uwd20Mx5W
         /zVWwC2H8lDKxC5ujkhpsNJqT8ZXnvsZQGq40xB2IiuxLrPQFqt18NRGJdxKN4G7UlG0
         MrZ/Z6AIrVYKOH0ml66fGonoHmvZgegUNo85WUbWPYmzGihMsKKRAWjDpeDapX2omzBM
         M409SdnJ5elBE6wsGuQ3aYpahSbUfIfNoTT/uI2+nTs5T9GF68S+mcaKeJYHaAQXUFGq
         7sbYmSf+Ef3bJwHoN/6PVb261gRI0AEIlUZ0SVzwYbVdwjWMAMOCtE9iajjjTi1+KId4
         lkQA==
X-Forwarded-Encrypted: i=1; AHgh+RpF6Ln0NtKfs7qD8jpSlhM2V++bpSYBKO5H6NRN4wRYb1Q16rxXXzJKkHg3ba0AHI8xm4jL7eDX@lists.linux.dev
X-Gm-Message-State: AOJu0YwHRhC1msPaPky6o+VrCD3LQzblb0pMVRzka0Mfinki4EfKHDz/
	4g5XWFoD94+Ic8vcz+8sHcqHKaFB8s3i7RGf3sPTtjmn958ls6b6T8tw71hOeFhOnEVseXrxPLc
	XFxdrehJMK1T/sk0MNJ/HRthGn4/nsWNHizvR
X-Gm-Gg: AfdE7cmHW7y15c2xq2AG6r60OqDvG+mtIZIU8LIJSdMnOQh5nsYtMoY+SsCx9Bx8Vp5
	kNYl3mZ+EKZoh/Ypg47uE6+ygk5Egb8lBjU0AMnTUP3T2TO1mgyD+deN6XHP6G2RWqkdCMhzUG3
	BwPkYNN1lUF2AAKQLLfZSdZFny/BPeeY3Lkup4c0vMOx5hVe28gVwPaapGZRrWVvuJAuOM37Raj
	dF9UZStRYSf7daKvafFviiseSkrzVoYWmDd9pzIdh3ootNuwVCS3nk/+Rw2z4uGiCVmQWC4Z+DE
	MDRtEB/2UAC1Q7KepUmASH9u4DetTtOe+2EDzuxtpTJGNzApph8tXol1UMuE60UfLk5ATDApL3P
	cdID3Wod4xuFC
X-Received: by 2002:a17:90b:1d50:b0:37f:eac0:18f6 with SMTP id
 98e67ed59e1d1-38942b7d8c3mr6216937a91.8.1783618992079; Thu, 09 Jul 2026
 10:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org> <6C80C5B3-7338-41C4-B85D-9526FCA0C8DA@zytor.com>
In-Reply-To: <6C80C5B3-7338-41C4-B85D-9526FCA0C8DA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 19:42:59 +0200
X-Gm-Features: AUfX_mxz-mLrakXPWzCXwBrKNQxY2SWK3VR2Xf-Fdw7s1azNGuFp1pzGwyXhOps
Message-ID: <CANiq72ka_Zk6xGUoQqrB+3JMfMJ-JDVyaGFCU+NGo=UF=Sag1w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthew Wilcox <willy@infradead.org>, Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2954-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.linux.dev:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 920FE733F58

On Thu, Jul 9, 2026 at 7:36=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> If Rust can't deal with different memory allocators then Rust in Linux wa=
s a huge mistake that we should rip out right now before it is too late.

That is not the case -- we already support it, so there is no need to
propose to remove a key feature of the future of the Linux kernel. :)

Cheers,
Miguel

