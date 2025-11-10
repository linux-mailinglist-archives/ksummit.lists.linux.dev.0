Return-Path: <ksummit+bounces-2590-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9EC48E96
	for <lists@lfdr.de>; Mon, 10 Nov 2025 20:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2ADE54EF623
	for <lists@lfdr.de>; Mon, 10 Nov 2025 19:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD9A32A3FE;
	Mon, 10 Nov 2025 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="APvW8e2u"
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598152DE71A
	for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762801567; cv=none; b=nZCWhlx9VXowsuac2qQVWYxr07tjmZXH/5c//JxM9Aq4cYQOHeGpVLcW2UCIQb0U+BVR+/JHrp7EFjbc4QJaQBSzvTBLxhG9GDQSqGWUpjmeczrCiBlBtaSMPiI8CxOZ23N5a4yyiHjTYNld1D9DkcBGY8IxJYa6RK++uvlk2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762801567; c=relaxed/simple;
	bh=CyW/t0jS8/xtCGVfRnRxA88iS/kNa3JHC6SPci4mWhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWAh8bc147nM9eyIE00RkoF4e6+M3JR0aWvg6pcD71gekZDnaD31ULwoGzHsbRt3sex/ONCdOiEzZyiuZ9SDcM1cUQQkBB3MBv695XKW0gRAHhTefC+arvuROBQu9+CzX8HY0k38WbRCb5qjmsZBIakaNH9COXq2fQLYzjqWZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=APvW8e2u; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1880088a12.0
        for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762801563; x=1763406363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yC9h9KgevFORynm2Mt501XSQK9XREZd59bnsTtrcIw=;
        b=APvW8e2uhG3egHTNIDN6u+/Dou5CBtZwBkEk7verhMXYW2p5rV3Ayk1IdxXdiUsbG4
         bm3Dclggf8wrIQxi4sDaeI20bZtHPbve42+8W8BuxVclMlyaFN2hfXXKFmdGiUHLg//z
         dvyeEZv+fFzGVlHbkUB+1FrN0hXLR87OD3/r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762801563; x=1763406363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yC9h9KgevFORynm2Mt501XSQK9XREZd59bnsTtrcIw=;
        b=VU4Pw0jlzlmr6ksT4monp1iLlztx/JSeJnTP5HGBY0E9KnPJfcrc9ueDNkz71DwrvR
         epSB4HilOeBk1b1+Z1CYFxHhS+HV1vZCY7n96OaOOyl2BHD4QnutuHEvYUOciICfQJ2B
         9xFZZJxkiRw7cW7lrj+6tDn11RyB1ssZnvdtpG/QSJd8SLZ9f0FVas5/yJShdpvn7A+2
         cLORT7nB9w35sG6Ry7hJngm5YjKAxwiYb5BQNnbiRet0EwyvCD4Iu8POTh4mTCOJF1qf
         cEAt/GwS0TP4fTzguC7f5Zu22x4/QmIIU8KjtLmUpQrDQQICpREI4takUEEcTTaAskCm
         tgkw==
X-Forwarded-Encrypted: i=1; AJvYcCWQWUbUhbN2lnzwh2NGTNppcm3i2aKE93WKWRnMQAyO+TFKhYZ8fuvj4dSzmEvEt8LVLWJpUpPr@lists.linux.dev
X-Gm-Message-State: AOJu0YzExdF7FCXxDDGAg5sj9JUXqaaKW50EXN8SEf5kK3Zjrd88d3pF
	dlyJB8IPFrdEp9tF/u0WPFVmGZ3wpNsTH/+34OMUaRazF4PduAc2exEVc0HoaulR1OM4vD/FV88
	G2jZwzS0=
X-Gm-Gg: ASbGncvpkV8Ml/xEvjwnP5LZrxXryT/bUmQW0SAkRphIyj9278Ih6hl+WQBE3SRKHNn
	B6cqVorJl8b6XV7DrpDsEaHSfPsIpVSo1/dWkSi+T2IZAUP7QrW6nV9iqrH66t6CJNDS5CyO4cl
	24whhT7FCBW1iQ2sfEi48rnMZ3ypU229W5eiKpBAonCdhHOcS0TmNPaC9wDdVbCDqFXayEgou9V
	lZFD6gcNs53DmedIWxk+t3PHo8H6HaCu9O7YjdfbtAXWXBcPz2CbPQxzcYD1tYv8SSVNlrwYAsm
	s5HcEpZWz1CZkG/x6pSGNR/XyzmkiKCY2CAETmwhpP2bD0suR8DE2RXKgxlS1CMfPeWqC44qhBE
	3AupQOCHwMY6kYv8rwhOIrxaorv7mm2BEC+CMgfqA9Tg5vYFkh6XZED+k8f1PZ4LNVi1blz+qw6
	VtndfogdfqDGUxlSfVu//Ikwv1NzOPYB3G3Q+VQ6CoxG8Ci/OKF4mJ15DAOwRp
X-Google-Smtp-Source: AGHT+IF70k9rAiN0ZEV90QcN4QmIcpBc+IcnZlQDhlQ2oySfjsMarMs4tyJFNwLnzVpsUniR9U5Bng==
X-Received: by 2002:a05:6402:51c8:b0:641:7a6b:c849 with SMTP id 4fb4d7f45d1cf-6417a6bde91mr5392286a12.17.1762801563404;
        Mon, 10 Nov 2025 11:06:03 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64183bc4533sm4245982a12.4.2025.11.10.11.06.01
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 11:06:02 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1880006a12.0
        for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 11:06:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXr4V+tqQYAGawsqffh1sUEz5ANgB/NcYwr+1Tl01bnwS6Chr4eA3x/QIPivdkQmEw6SiYWATm@lists.linux.dev
X-Received: by 2002:a05:6402:4405:b0:63c:690d:6a46 with SMTP id
 4fb4d7f45d1cf-6415dc17adbmr8488286a12.13.1762801561491; Mon, 10 Nov 2025
 11:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com> <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
 <aRIxYkjX7EzalSoI@kernel.org>
In-Reply-To: <aRIxYkjX7EzalSoI@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Nov 2025 11:05:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
X-Gm-Features: AWmQ_blqIHgBQQDHSwmkxkjAcHIrd3aWWcWyso6SGQ5JuQQ_nZmYCnfiBeXmcbA
Message-ID: <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated content
To: Mike Rapoport <rppt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Christian Brauner <brauner@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Nov 2025 at 10:39, Mike Rapoport <rppt@kernel.org> wrote:
>
> The novelty here is that AI does not only transform the code, it can
> generate it from scratch en masse.

And why would that make any difference to the basic rules for us?

  "Plus =C3=A7a change, plus c'est la m=C3=AAme chose"

It's a change in degree, not in any fundamentals.

                Linus

