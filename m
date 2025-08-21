Return-Path: <ksummit+bounces-2186-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C709B302EF
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF801BC6D0A
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5A02E9EC3;
	Thu, 21 Aug 2025 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aYbsYaPP"
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75127280B
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804792; cv=none; b=Ux9HLTYGjKUFWxpC5i+TQbh7tHzsrYy8mrq7Ys+jFrsgqaJ6GlLl8sAan4eaI7jFHhYyUvs+zKp75UHDaCOJnOzEj6oJmCEvEwBrMBXHkvUo4rDLvaUobs3Kp/yH1TaE25qSbBeQwkjQTqdRI+sCOQpYjhZBaYWoNbcmXampImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804792; c=relaxed/simple;
	bh=FNKdQ2Q9j36mgXRTTKI7GXB4mhjWXXIWbw7majwblus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeqYBbQ6M3EC9ac6RTIYPArRvr3zL3AUf4ctqsJS+sSKKjrDbU2K2w0O7zoMKWjByjdrsQ1tV70GRZ9cQhDMMgceo6toCvAdC8WTRdHdlI8sy6Ej9LQiUTGwjaYg1m98PulLeBSthN2XF1SbcLtabkYzEZ2Z5nfkMmpes3sCcTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aYbsYaPP; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32326e202e0so1335428a91.2
        for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755804789; x=1756409589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpJ1JUIhWo3zxoVLim9BIZbHFtWsNpYjF3/W08jmiX8=;
        b=aYbsYaPPpVN4sdcBvSvWLInMLwi9KijhV5ADBG8ThatuBxPkJJeJqx4t08K+wcMVFl
         CDXaWgnt0FG+/AhWyZxrDUnW6VmUmnB6dLam84mrb+f8FcbYU4LSCocNnPqvmTCUwR3g
         cNKSirOTzJADQ/afD9K4Le7zN972U3dZLshQu9hsgenCbjGryIoVddOoyzt/Q2s7lWoe
         CQlYd/1sxUSNswarp+VHbXkoL15onvyN+i/E/olJO5u4VQi4M7rk/GoJfy9fbsqldMVS
         fnI6yH3IZ3N365WT3CgyJaI4K/IeTAOUvM9br4EIwWD1Xa6paO8xdFgqWzxNsphUXBHv
         mz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804789; x=1756409589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpJ1JUIhWo3zxoVLim9BIZbHFtWsNpYjF3/W08jmiX8=;
        b=LSo1DIC6o5D+/4Fl9gR0gp6ULXQrvgnSO3smtuvQNq5VA+LEAG4NP+YtaOQp6C2lns
         4jtWuxPCUJ7gfyTcyJquK/NSCCq26ghQMTsRgSX3zVyAXs43UlirNi+oht2NJfYMHt9m
         a/Z29h+i0bs+QOjdzKhkvZMMNfGoUhMuWy5vorygcRPQXSfpGiTQOMUobGXkzuxKlS1D
         W53c2zjuM7UPsvzWm6GRTKhuWK5im06l34zzH4sPvdQcGUjHc8s3xBaCcT5qc/E5vpvq
         +MRxds0Gw0BJXli4IrkG3VF24Y4Dexqo0U3AR2a0XNr9fY1t+ed/fFGhbu7nbARYtQdH
         PB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAVXs+SRT0ctyIbuZFTBS0UY1egGAfJKNtScgK4lKveXDZRlgVa3tsaWySk5Y847ffA5G3/q3R@lists.linux.dev
X-Gm-Message-State: AOJu0Yywv51py+i9Nr85Q43+cN80pjjqmDnN2rqoBxwciR+d+Sqki1O6
	WTABwNl/4o7f8qZ35kwz0vs7qARjQSJLGz1CAdCbQkgY72ExxbBWMHEbWTp5qiKlV/mclLheMlS
	SoeWIwGh5A9DIGTANrB+KiYGU/tydBC6MPaRo0BpBYgvFiPq7BZ0=
X-Gm-Gg: ASbGncspFTrmzaWE9rdU9Iu/ZnmYOyFpBzpsKvaT/bRxu+tdPDsZqNOJi5TMzM/T6x1
	MBjfjJh2bhZKT2Xo6yzYekFVI/3fSJRVfI9xhbYoZQ3mqbD3FUhCCWtlibYTxeDdEe4LWujAxMo
	ZJZaJiR5FP3TtLTbYQ0tmVsBSVlMUjrruKGkPj1cu1vNSbUWELvEUXRryJ9y3P4aVhQ+Kx6hKaY
	nzApR6j0xQe6uiE0w==
X-Google-Smtp-Source: AGHT+IE3rSz/S9joHsxzgn3nqrAjaVgh+JNeXVJWaeHVu8UKpssEwvNF8sTjGNJifciDTputJMBgY0zCaDMpzHhVtr0=
X-Received: by 2002:a17:90b:2752:b0:325:1548:f0f with SMTP id
 98e67ed59e1d1-32515ee0104mr777322a91.14.1755804788711; Thu, 21 Aug 2025
 12:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fc0994de40776609928e8e438355a24a54f1ad10.camel@HansenPartnership.com>
 <20250821122750.66a2b101@gandalf.local.home>
In-Reply-To: <20250821122750.66a2b101@gandalf.local.home>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 21 Aug 2025 15:32:56 -0400
X-Gm-Features: Ac12FXyBGe0rSMh1OHfkwA4myJIJvSYM_gON_hNIj_jpU_PMzU1SrEYwDaM3olM
Message-ID: <CAHC9VhRoFb0xmmfzqqMhHqABLnnP0vCiPJHiVgLPbrVzi6djDw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Adding more formality around feature
 inclusion and ejection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:35=E2=80=AFPM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> Perhaps we should have a maintainer mentorship program. I try to work wit=
h
> others to help them become a new maintainer. I was doing that with Daniel
> Bristot, and I've done it for Masami Hiramatsu and I'm currently helping
> others to become maintainers for the trace and verification tooling.

I realize this wasn't the original focus of James' mail, my apologies
for continuing on the tangent, but I do think some form of a
maintainer/reviewer/developer/etc. mentorship program is a good idea.
Like Steven, and surely many others (staging tree?), I've done similar
things in the security space, and even in the most informal
arrangements I believe it has helped people get up to speed with our
somewhat unusual development practices and not-always-documented
processes.

I would expect the program to be fairly informal, especially at first,
with perhaps an hour every week or two where an existing maintainer
could work with a mentee off-list to answer questions, explain
process, code, or anything else relevant to kernel
development/maintenance.  Time zones would be a challenge for any
interactive discussions, but that's a common problem for community
development these days, and finding ways to resolve that would be an
important part of the mentorship.

--
paul-moore.com

