Return-Path: <ksummit+bounces-2866-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qRe6OIh4pGk1iAUAu9opvQ
	(envelope-from <ksummit+bounces-2866-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 18:34:00 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D409A1D0D46
	for <lists@lfdr.de>; Sun, 01 Mar 2026 18:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 461633004681
	for <lists@lfdr.de>; Sun,  1 Mar 2026 17:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E888530AD05;
	Sun,  1 Mar 2026 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JIlw0l+7"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06E2D94A7
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772386434; cv=none; b=pNC7ohLHBeNRFvBeWPgDfnaH6/eRH14tGpW9nqMmlHxTm2peivfTjInbCv8Ed8aTrv+5gMBl5JwrdHCMw/DNW4wSA2nIlYvnXSydm4WOCgK9uhIWAwlE3yVRLGtugM4mnTXZopbgRU+8+mw0tkOmxNM8mhtg4wgnxycXALyU2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772386434; c=relaxed/simple;
	bh=/vKCW48X+626AJz7hc1bOxNbOS88IU5Ge3jrX7YJIXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bz1tqD1dM7F3uwOGDnTxzIq5mrG9m67VLJd9rLMSwwIJAY0y5Zb/rSNsQzBiF0m2xD1ArYdg1rDqThfyykHkiswUJ3PCXcJMCZwcyzR2/vW+G+5R3uYtVgbkzTMSXWSYToolthtGitUc8L1Kvi7d+rve9MDP8XV4g5wWOliFpzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JIlw0l+7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a43a512b0so4103190a12.3
        for <ksummit@lists.linux.dev>; Sun, 01 Mar 2026 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772386431; x=1772991231; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PkMl8jtfZr5Lv8TbSzeB3XapV4DOUgTl0P+4M/75wn0=;
        b=JIlw0l+70B+siLTSIqNws4hcDSuFlv7K4pYS6hfFTQjpnPv9QXGMWNowwDJqZBH0KH
         p3CkCxFBOvRsOQ+p6Zojsy9K9hFyp45Gqeg3jTIn3Rnm9V6mCo2KtI2ODaOtRf3IL+ZM
         ZPb0jdqm9DE3ihrrttgeR6x0cU4D8a7SMHHTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772386431; x=1772991231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkMl8jtfZr5Lv8TbSzeB3XapV4DOUgTl0P+4M/75wn0=;
        b=Vpg1+OnWG4B4AuKM4ygWhmJT6qjiVHUwnt4E/t7DS1kQTTd2kxzDUtZdndQIyfLkg4
         nnpzJsxcqK2DxExablQmdKrPjRJNGzg0VvYOrScvdZSrKfZBQKIerFNocMBciKBqvmOC
         siAeurnFcJHq/YRC16TlmQzsDbORd9HaU3nLj6qxvZ77yuzgIYOVJAw0KuQJV1TUOSBU
         S3In50Bs3L6fXYoXfp5x4ehbNL7tYqCoRQM8ysdNyHonj/AVP8mu5q56F4o64j91ZiqA
         xCFqUVNc2fTfdNw7cKoQCaTjhQN2bb6UVfsfB5jRVfkK5d9wLet69clc9UP5Jcmhxv7o
         mFhg==
X-Forwarded-Encrypted: i=1; AJvYcCXPgSWHN/TQAfEGlvjkqENJaisjlfB/+o7RcdqpL5L90668jSSroEEHVTuabJq0/WdkWXrp+jGS@lists.linux.dev
X-Gm-Message-State: AOJu0YzQpIyn1YKg6vTtn37b9xKEofosz84LpkWvpKjfxBlGtwjZEgo3
	b0Gr1WQjpCg+/IAk+v3k9Kc/K+QB4TkVPI0WVA0khq2flZEKzND+VdDsuO8fX9y01Xo1Gbf5TMe
	wIm3kNfM=
X-Gm-Gg: ATEYQzxyG49SIXDxKdhacRIWJrChCR5hY0eL+K9GHCownCb9KVNPoUVzdiVCQmtfHyS
	U+FnJ4FBqfBqLamVhqyDG2GmDCnXg68TSTF74UuvfHLVl30+v5iG0Y7PJ+tMIu5xzF9GMjdpoHU
	YyGEJyj5uE+qUTUmALZvMZ+FANUBkzGbjLex6BGESNN2/gZjaBUAdwVN2p1fjftWf/uYodlhNgi
	kiKwFFZpCawIZkpn45e7NUQ8sLVqjVyHggcm9TzjZN8uwGeVuKo+kO/1Sk2RKZ+X1Q2pmkRABCk
	NZnVYjJ0Wa0x8dm4YnMgu+AA8dcG6hfNPi9WLZ4JK+wifRC3UB1/6Yd8y5VcQvz11Dhspr+xjzz
	dW1BzeD5qs5q8/WPBlxit3EwIZtoj2f29MT7FmAqpzbhqd28RwLdwz4RCVg2G30b8IdYCLXFoLv
	kSgwDyJYMBCG58XLCwlcnOaM0gdsepsxSI52oB8214yyI5rBX5URaGBIUtsPsPwnSjhv7RMc9oC
	V+2zwYzow==
X-Received: by 2002:a05:6402:270a:b0:65a:2903:3164 with SMTP id 4fb4d7f45d1cf-65fde4d2d6dmr6170146a12.30.1772386431176;
        Sun, 01 Mar 2026 09:33:51 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06dd07sm2797078a12.24.2026.03.01.09.33.50
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 09:33:50 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b934f8ec6acso434068466b.2
        for <ksummit@lists.linux.dev>; Sun, 01 Mar 2026 09:33:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUc6bhnQYA2h6Xgzsgy3s4F3n0omZ+ctrJE+3ShgJeNYw9I7RGpuYoIzpoDlHT0SjZjUheAHMYL@lists.linux.dev
X-Received: by 2002:a17:906:6a14:b0:b93:5f43:ccbc with SMTP id
 a640c23a62f3a-b9376599d3bmr594132466b.53.1772386430447; Sun, 01 Mar 2026
 09:33:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at> <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at> <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at> <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps> <20260301153526.GE2860169@killaraus.ideasonboard.com>
In-Reply-To: <20260301153526.GE2860169@killaraus.ideasonboard.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sun, 1 Mar 2026 09:33:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
X-Gm-Features: AaiRm52AB5znH2LQsZnFtA2EvQ9g4t5cwGw1-rFuNRjG-xZA_NRs8I44hHsNz4s
Message-ID: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
Subject: Re: slowly decommission bugzilla?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sasha Levin <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Richard Weinberger <richard@nod.at>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users <users@kernel.org>, 
	ksummit <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-2866-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linuxfoundation.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ideasonboard.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: D409A1D0D46
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 at 07:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Do we really have to use non-deterministic tools that will inevitably
> produce correct-looking but otherwise useless backtraces from time to
> time, confusing developers and wasting time for everybody, when we can
> instead easily develop tools that will work in a deterministic fashion ?

Please do develop that, since it's so easy. We haven't done it in 35
years, but I'm sure you can whip something up in an afternoon.

.. and in the meantime, how about we not waste real humans' time
having *them* be very frustrated and generating non-deterministic
guesses - and inevitably incorrect analyses - of the reason for bugs.

Christ people - have you even *looked* at bug discussions? They are
*full* of those "non-deterministic and correct-looking but wrong"
guesses.

And that's the _good_ case, when you have people actively following up
on oopses.

Yes, there are real humans that are trying to use informed guesses as
way to a solution. Sometimes that guess is correct - and with decades
of experience that percentage certainly goes up - but quite often it's
a "maybe you can try XYZ".

What the hell is wrong with people? This whole "AI can be very wrong"
is obviously true.

But it's irrelevant, and equally misleading as the Sam Altmans of the
world that lie and exaggerate through their teeth to make a buck (but
when you do it for money, it's called "marketing" and is obviously ok.
Sigh).

Determinism is fine. But the world isn't entirely deterministic, and
it looks particularly non-deterministic when there just isn't enough
information.

A "good guess" is sometimes the best you can do. And there's nothing
wrong with trying tooling that does exactly that.

Should those guesses be *marked* as such? Hell yes.

But this crazy "it's AI, so it's bad" needs to stop.

               Linus

