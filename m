Return-Path: <ksummit+bounces-2815-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APB+DhdLdWkJDgEAu9opvQ
	(envelope-from <ksummit+bounces-2815-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 23:43:35 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7137F27C
	for <lists@lfdr.de>; Sat, 24 Jan 2026 23:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C3CD300DE2F
	for <lists@lfdr.de>; Sat, 24 Jan 2026 22:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D72C27B327;
	Sat, 24 Jan 2026 22:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yw3t0tv6"
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD219C542
	for <ksummit@lists.linux.dev>; Sat, 24 Jan 2026 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769294607; cv=none; b=lmtPeHAOGa6P/ic5+1GyYJ8xauKoC0lwb3zj4hlAU/dhFHr/kReZBKnBqP/KwIUd3okZGCdocg14Y47wIbeyKyOh3Pa3+bTbcar87d6F3gNbjYuuNyBHpGMBLUdO+tOWnCMos1yw6mDQF7XFwT+c2mHdEdjLNo6EBB2U3KJGpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769294607; c=relaxed/simple;
	bh=bFs74ldgEs545C9dYyMjWQKSP4myYMqAPs821jlWLR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbCO6ixL957JbNphzoKUlXVq99gGTSCduBNZ2OJXr9PTk2fWytdtn/UzLjd8zIC0twxxq/J5HAW27XG+eHolwS2Shlg5bAJDqAheoFeIMXdtbcB2BlpUAIP50f+gL4GYINoqHRGCUbZI4Ug/aAlAPcEc9Rms1TPxs2C3Sv6S7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Yw3t0tv6; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso6941309a12.1
        for <ksummit@lists.linux.dev>; Sat, 24 Jan 2026 14:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769294603; x=1769899403; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2asHAGon+VNideICZe8pfEIOiUzoTaBEh/1oj8i9XDU=;
        b=Yw3t0tv64FUSNXt5QeZ848rdl4EOMOLaTdKVe7w1VEt1tpXQ8VWa8SKfXg4xUO/y+j
         m3SAfl5idQo6CtGCNNvOjQ8isabIAGTAkid15GXyLPdtKlcYsEhA11HnsVP6HP/iaPpw
         L6jB2aGTdPiT0eAQLdzbDsV1KegybCjMkszac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769294603; x=1769899403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2asHAGon+VNideICZe8pfEIOiUzoTaBEh/1oj8i9XDU=;
        b=OoCKPKhxl/7yibE5EMGH9MrVuo7RYyKQwmnE88pSM1aXwHVTazai9D/1D/p5JXTPHx
         XEC1Q4CBKBrQ1wCFmtIxhEGMVRs4bS9iAxcpo4zOfsOQdhoMOYTTOEnvfYx7qzqimHuU
         yVwe4V+Y2gTvl42B8ggZ9ppXIeKUH/voWmFCVVOq5Dq4UJp3r0qtQwpLgKnfLekmI4la
         RYqWWThaJyMZRlrYtctSWs/31zt8vGnHIpKPiZRDCB++5+fmWlZOLpJJdmpDAYFAg88b
         Tdb3J8AqFWjtSSDY1mgtLp3kPcK7c/Vmaa+nVdNVgzL4kUAp1S6vtEIEmSMGPQP9T2g+
         No5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8rPXKrbO0ESS5OOKtmT13C8SbIHvu30GFFFEOeUpKKhhYrxXEuaJuqiwMGwHmokYWVw0Ixj+z@lists.linux.dev
X-Gm-Message-State: AOJu0Yynb8ShpvG7J0+MR7Nq2YZca1SactjE0dBysYQ3NOZRMHqFjSmO
	Ik8k6ABztU8eilqHvsLdPCCzMYo2RROhQJBSTrUtHj0qZmdGjbqEJzENdaOIpeTd8OU5ZYoHiSm
	Kc6oGB+megw==
X-Gm-Gg: AZuq6aLbWuAvr1QMJIhfuiB1vujSpxKf7ZJKbHeBWX2RFmWtucjyn2zCjEtKWSJAv2e
	gd02tQA9+LdJpeO95cROtj8/5TBUur3ZUtCiDX30yfRwhHJGbizkEvV+cY5vOv15hpiraJNI38B
	bhcYyZoSpSbbVGtRjipC9+kXeWr+aaddvwnMaty1mK1JVBk4oUFCVjwUwMfGK3BBc4Q+U2WpvFu
	MgyBDKpCFZ/PMha1MCV9pNvZQGR5EJJGr0EPVvgFCPrzNJcjPj459AqzHbTK/apkjBq9XdSHHuB
	iuoWtZKcwrwqdDejcDmMgXX6wuOfvBbcWlya0mhVe8y8f9QtaFZH9y0Cucbj0kZLgxwnoiK2vpT
	FoWDeCvy1XqR5x3i5ZSIqmtglATer0w7bcJZ+UJlYZEiaGB/5Pm8w6U5WenVHhmHT4DlK1MPkvP
	/LuNDXWEwxKa9mt05Cw/JK4UX4Y2pKMRJumvKYbzQNWTUcoJ6XoupGK8seaVlf
X-Received: by 2002:a17:907:7248:b0:b87:bb45:bd59 with SMTP id a640c23a62f3a-b8d2e823c49mr2401766b.45.1769294603159;
        Sat, 24 Jan 2026 14:43:23 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b419642sm344464866b.28.2026.01.24.14.43.22
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 14:43:22 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso7027523a12.0
        for <ksummit@lists.linux.dev>; Sat, 24 Jan 2026 14:43:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnCAWHQc/7Fwrahg2u10UkYdycgjgtizbN4PfSZFVlGX/uWORu40dpXtUWBAsgg3NoS9KMSZj+@lists.linux.dev
X-Received: by 2002:a17:907:7fa7:b0:b7f:e703:fd77 with SMTP id
 a640c23a62f3a-b8d0a73aea6mr3091666b.11.1769294601833; Sat, 24 Jan 2026
 14:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124012256.1856709-1-dan.j.williams@intel.com>
In-Reply-To: <20260124012256.1856709-1-dan.j.williams@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Jan 2026 14:43:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whUg3js1GV4f0dmC+nvJbiNfsM7QZv7k8Q6AoFUfeH-KQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg6PDHeQgXMVxUcoyhou_bAcrr-GB6hjHU90Bv4hQ_FUyctMpKtga7aN2o
Message-ID: <CAHk-=whUg3js1GV4f0dmC+nvJbiNfsM7QZv7k8Q6AoFUfeH-KQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Project continuity
To: Dan Williams <dan.j.williams@intel.com>
Cc: corbet@lwn.net, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	tech-board-discuss@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2815-lists=lfdr.de];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9A7137F27C
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 at 17:21, Dan Williams <dan.j.williams@intel.com> wrote:
>
> Document project continuity procedures.

I think I'll just commit this as-is, and directly.

Sure, it could just go through the doc tree, and that would be
"standard procedure", but when it comes to something like this, I
think it looks better to just have me commit it myself than have me
pull it from some other source.

Any future updates from further discussion can then go through the doc
tree as normal...

            Linus

