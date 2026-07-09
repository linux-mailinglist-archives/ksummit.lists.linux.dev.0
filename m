Return-Path: <ksummit+bounces-2957-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GO+RHNPtT2oSqgIAu9opvQ
	(envelope-from <ksummit+bounces-2957-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:52:03 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686B734898
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CBRNr6m6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2957-lists=lfdr.de@lists.linux.dev" designates 172.232.135.74 as permitted sender) smtp.mailfrom="ksummit+bounces-2957-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 754713063240
	for <lists@lfdr.de>; Thu,  9 Jul 2026 18:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8523543B4BC;
	Thu,  9 Jul 2026 18:44:26 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48843746A
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 18:44:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622666; cv=pass; b=lYHQBpgPhxwQt+6f+HrgIiUy84tqoaJwrGku30XJcJb4r6lTEGkQ4TEljvO4dHFrczd6+S+q2yTllJdaRcdiQa8hkuR0HAuCDmJ0bDQgjRuE3BHR1N9niJRqIBTTXVN6Toui1F3bL7o7AgGxfbjU7s8A4XKEr+VQBy1eP7joxy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622666; c=relaxed/simple;
	bh=bF7Dpl1te4Lk6J9LHE9t8SYycWMlNdylssKH6TQcsZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuqlIi0hfU5cVD+XN5Mks1IG/BQKiQiMbs5TdJul/1XxmnY5/mnxCexNz3MWx+r+JGEj6GmKc95KlQ3yQnbFCl9sxgibpZVzc5zYYn+8zo1pEHuE3MyxEe+VThujPeKYgggs9vZJ9M9PDDw9y16CovJd8k0M32LwYp+nf4FCKlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBRNr6m6; arc=pass smtp.client-ip=209.85.215.182
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c88ada0e12aso21268a12.0
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 11:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783622664; cv=none;
        d=google.com; s=arc-20260327;
        b=M3e51IQbRJDYfz8X6DNIfUSVquLkRP2oiCaBDE5dkG04Eaa1Kjy1Qjvd15X0Ih+J90
         yY/bhMJNlrPoVHp8NiUY1LlAiqxg2tMTBGQrlOHAF3xUtQwe0PidiQJwVAcBzggTvIC5
         IYOeDh0HVkcZRFa1Zo7oCSxWXoxwsneBQd2Ix22RZFTwQFpIZYCNHklTLKC+7DfAWndg
         +imyJg3CwMtPt+wUCoo2hEQLnCAmczt9GEzxdugxs00tcAF+okC4xBzJl+o+WWVA3J6g
         bb1AQo3h6th+NL8RPi5V2JoR1DP4nntIDLHbAK5l2cqVWEqyoYxNLHU3oycPzDD7uCh8
         ovLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfL/jqBrR6ltGD6VxOxqggwTNXk0Dly8MDIQnLtuDT0=;
        fh=NvFUNcaOzhQob/Cmmek0JBcgGDdBBbWbAQpDV2tiYDs=;
        b=lN7Zh8j5nvPKHqW6l30fQZFMIDOhiDKkGdYOnqhb90g05h+nr29qyUVlu1+A059Ken
         qBbuEleI6fax93OsO5oL819KcDTn7IUKhcslBZGqc4h+y3OOiwUpZdfRF2myGMxXFXlU
         McFj/tNxhKV+r4Hh8gHl5mmPNuS3lY0qkb3935KEplRI+pBvYcQapTMxfxnmKakiekrD
         ZICst8F4KCcw/XXDj7p/fE4A3x6nPbnC8tPpCLT4yP1YR5mPAIeoSX6rEqrlPM4eTHMi
         JBBzfV4x/HLiEad6X5mb1l5pjTgPi/MvdZoLMfrLJsF3dY+bNyihIe2KY8TBS5CZtcLG
         ezXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622664; x=1784227464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfL/jqBrR6ltGD6VxOxqggwTNXk0Dly8MDIQnLtuDT0=;
        b=CBRNr6m6zzjW9mHilOCGdE0jlOJEKeudeXXLO6TkSRn7bTvvzvpdnBiJeWaiwxR9IL
         4Byudfuax8f4zvZeJ/WUczQy2CiGv5Jo8C2cDKzPL6K6OfwfYcswacwyFxcW8V9ZG//y
         y8DYhQLqqHxR5AxrpO5CvULp6blf1b8SCspzLOREyKLabFqqYFFPIJ4DbJ+IgkXvusRs
         oi4lvVFIj70xB80n3ta4pkcvUE3HomcwqGQFbNc9m7e9FQDm5x1f9QdGhLhs4KFnCt59
         Jl2cU6OOK8xJ/ugTqrZtZXYdN8mhxHmAJ1gkCz2xYckxfY6RIRjPq3q+H2hyOUX7RGzu
         bWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622664; x=1784227464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfL/jqBrR6ltGD6VxOxqggwTNXk0Dly8MDIQnLtuDT0=;
        b=A8OCmqMfPFnmTjf9IFxI3iNsS91zrk81rIeK3XQBCBmAH1WBuFvRt5F7Z9z4WN9D+a
         xs5+mrT134hBCCC74PHg9xzgfGo0VJlZfgmkJNFyIUF1n+ErjE5KI5gfGo8OOqdBxEle
         dJABaNjdJJsGiHTWCsaXkaXl2/dUXbzfJyMGOhfdiCohjcL3IjXFoBail8pJDDU7ioE9
         nWGRcmVdywyhVJOdV0w+mA1ltOg1x8iBbJSRB8/h9kXkEe0rfAUwx7vSji2JNlImjDDR
         J+tKoArj1eJoiKqdY/5n8N2v03AG4MyqmONYEISprMaCvHwrjA1Xuql+O6wrQdHzMku1
         v1vw==
X-Forwarded-Encrypted: i=1; AHgh+Row0jpoos9C009E2NpEPC37cQpQ4ZuHeH16ikYZkl2aQ5wdtELjWo6IbXUsEtynkvaWcxIR470T@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpcl7rl9P3oxtfL7j51hT6qIEUJb5B5iyoylaTR97zn0fTNGqp
	2/LV8GyfqeIdhon9Z8RkXdG1AinT3pWobUSz1LDqHsWF2EZMUaF0KmosKG4iVOPrx1WxnxjIIKW
	Hp0doJFUKsUSqcT/uoa4s7mHk9rqVA7Y=
X-Gm-Gg: AfdE7ckxPpWYCGgxB6HKS0gpCT6MWAv7RYp0IxdbbTv8AG7thPSTcF1r84BPeP24cn6
	m+vQkqqBWvisIY2eK62bwKKTMvGKdqXZShXFobKwvOY5jPQrLjNXAmKOK8pkypG/nqUx37+zwIu
	aoJ5R9NYk1VQ3YKcVZwO9RRsmm5CC+b70lxhB+v8TCXC24rUEY+ResEcSuMjlYBcXa2k2dwyPPq
	yHhlZLzv9DQRcRGqh0UChXKp8tLbXQaQHzp8nHHAOzZ5GgHbFEbK1e6t3cOs3CcP3WlY2HH7h6/
	rCLXLg5GdbVd0Nbh+BGzlsXIO/MlrAAZDIdcMaV58+VaET/cdEtZU0N0VXmIwOxo3+ZDme/f6pU
	3IFQ6iuW5r8s5Cj1dYnkDYaU=
X-Received: by 2002:a17:90b:3fc5:b0:37f:bfc9:55fe with SMTP id
 98e67ed59e1d1-38a20c49089mr4107095a91.3.1783622664188; Thu, 09 Jul 2026
 11:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org> <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
 <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com>
In-Reply-To: <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 20:44:11 +0200
X-Gm-Features: AUfX_mxOoQ7RqqQNLgp4uTzipc6y_LfMp0cxy6WGg01uzMDy0MSuitpFYJuUqJ4
Message-ID: <CANiq72m+YTQ7NG4m8h7ho+GCkx_1Gdk6WuAeZ+KAORiETytWig@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthew Wilcox <willy@infradead.org>, Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2957-lists=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:from_smtp,mail.gmail.com:mid,rust-for-linux.com:url,zytor.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0686B734898

On Thu, Jul 9, 2026 at 8:18=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> In case it was not obvious, my comment was meant to be ironic (reductio a=
d absurdum).

Ok, I appreciate the clarification and that you consider it the right call =
then.

> In fact, I'm surprised and worried to hear how recent this was. This unde=
rscores my main concern with Rust, which is that it seems to have *very* di=
fferent stability criteria than the C code, where we are not allowed to req=
uire anything that hasn't been in gcc for 5-10 years, after which the clang=
 people discover they never implemented it and so they ask for another 5+ y=
ears of keeping the old-syle or fallback code.

Hmm... What is the concern? If it is about the window of supported
compilers, the current policy is to follow Debian Stable's version as
the minimum.

  https://rust-for-linux.com/rust-version-policy#minimum-upgrade-policy

It was openly discussed and finally decided in the Maintainers Summit.

As things mature and we get the improvements we want, we may want to
extend it to two Debian Stables etc.

But please note that, regarding allocators, we could have moved
earlier. As I mentioned, we waited as long as we could to see if
upstream could give us what we needed. It didn't happen, so we
pivoted, but we could have done it earlier.

Cheers,
Miguel

