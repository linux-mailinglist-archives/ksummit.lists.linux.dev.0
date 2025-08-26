Return-Path: <ksummit+bounces-2223-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49CB37383
	for <lists@lfdr.de>; Tue, 26 Aug 2025 21:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAB98E1EA8
	for <lists@lfdr.de>; Tue, 26 Aug 2025 19:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A298D36CC73;
	Tue, 26 Aug 2025 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtH8U9cU"
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F830CD8E
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 19:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756238273; cv=none; b=kHa/4vZ4ZiF3d8G/WJ6nCNiJLgT4lfqQvPP82iCHmZv0KYeei9FtHuRH83IH8lq8wC6dD7HApcJufK7SBl0Th5EPVy4KggDjePpZRfoSHrdTpudkIKxGmHkJVfl+kJmujUUucWou7Ej4TaN21px1jJKYc4BWddzRVrVsrW8+hpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756238273; c=relaxed/simple;
	bh=Rzvu0tvTCMwnOJ48p+0COzbe+Kfv09E+j3FnXgctm6o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lDDbVpZOXUkxhsG+C/1YCbGtbkXRMOGcEIGSoSyMpJf3YSR+1F0v5WNMt50BwF4BJjA3Dv2SLBru+r4XxdAXHHrcANbiTKgCnfP+I4dJep85c02LnO129ezuUTnTqELMKXxhTKsfBoIScOoZSrp83hZk+LzQL+1ypzIHRHUBiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtH8U9cU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a2befdso911797866b.2
        for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756238269; x=1756843069; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzvu0tvTCMwnOJ48p+0COzbe+Kfv09E+j3FnXgctm6o=;
        b=DtH8U9cUoko8grjI8aXKjpP/vIGqxSF2lERhs+VqLyB6bgQA1J/2l0IcE6XeQHFg5t
         1FOWPD/4aQKWrO4Ph2njeovGseODUYDZX4zA+mgVuJdophRDqn2Ap08hbJwGKhfaSz4q
         nz9tHO/LevPAdaXD+NYtHK3wkpH7+c0u2A1c8kASh12NqqhJixbYWEsv67qaeG3M5AMz
         JmbzUbj4JTgnWO4dhM9qTkV5nqmIntpZRfiayNbhrSX+XUdjRAwT4vWqkxzXH/P1D+j5
         f7FXuTFuXgCoE42oAkm+EsCN93wZnddA3plZ1f/i4f0jLaIUu4Xl8YtIxj9XUNJMK1mx
         UU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756238269; x=1756843069;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rzvu0tvTCMwnOJ48p+0COzbe+Kfv09E+j3FnXgctm6o=;
        b=d4TmNxaWevTXxSmJ0Vxg9xLEeMuj5m/qwygLUWaSxu7FocFYQcphKPm+wdzQClnLHm
         0LZ9ZczR8rzc/7RYPq3HJ1n0KD/hQjQiaB3ghwe445wgJzgUBQKhoxZF7R+NfI6bcyqk
         F4XlXLYFHuAca9ADAWBsng4ovNViYcuqPkG+Wun4muXS2WhRQXrWpHn0jhhInysinthk
         UwLRuzvwBMz545Vf0qy++/Ssuo7HmsdCTqSagBp0ksqXfYMCaRHGxqkDiK7gptsKUpof
         zKM6hW92uvK3LBLuyScTU+vTZt9cIDYXZrabDmXPTH9osQn/kAi1YgLZb4h2CTLgWjej
         QI1g==
X-Gm-Message-State: AOJu0YysezIQVTBiDmiQ9kFaYPjxKFMuZcVxzJvf5U+tKQ3djveeFiho
	tdT4rzWxNVSu6sopA7vHBzOONXGGlWpaSJObNBCUDeqieef5F0dk1RdH0uOpgpm9bJ82WN/CIjP
	nJJqJ4pWLhCj5dQFYdMdMKDIyroA+cCkL6sJR7Nicirc/+NyklrpwnqWu4A==
X-Gm-Gg: ASbGncs8cAlp9/cr9BAxvO6VUOfsFYPYqhaPFQ+B9h+8/W+853VPgpDPYJ3de0JtLOJ
	DDF2E16AoJvPZiQmei+obX43egLrEm4d0T+XPtCs5ndGnI8JICUCZ8qJQLVv9U06SZXtJiw9nZM
	wXRsc1L1tiQlBAwun3snPH+oYpghRCssciv5iWn/uZIcDZx7Ws0yZ4riauaJJ+ezy9AQ5L9I2Rg
	e70WjbCqLV7qtOQQayYQU6C6k4iGQisopLwzmk=
X-Google-Smtp-Source: AGHT+IG+3luHxwInJXXYQq44Gv6XnUxWR9eHCXk4rJtY3hucL3sccUU7TYcpBoyWCBxTQB6vrWPtDAUMMJkdgSt7ojw=
X-Received: by 2002:a17:906:7305:b0:afe:78c2:4d4a with SMTP id
 a640c23a62f3a-afe78c25066mr765842466b.34.1756238268647; Tue, 26 Aug 2025
 12:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 26 Aug 2025 21:57:37 +0200
X-Gm-Features: Ac12FXx3_VaCf7QVUAruj3KoOiedZ5UUlEBP_7wXARn2t5E8Sz6ETqdxEWInWls
Message-ID: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
Subject: [MAINTAINER SUMMIT] Enforcing API deprecation
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am not sure how many other maintainers are affected by the issue I'm
about to describe but I imagine it impacts to some degree all
subsystems that have existed for a long time, have undergone
significant reworks and whose API is used ubiquitously tree-wide
across many files. Power-management and device properties/driver core
APIs come to mind as potential examples and I personally face it with
the GPIO subsystem.

Deprecating legacy programming interfaces after introducing better
alternatives is a natural result of the way the kernel is developed
and the size of the codebase. We typically cannot rework interfaces in
a single patch or series series, especially when dealing with existing
cross-tree consumers.

What we usually do is:
1. Provide an alternative solution living in parallel to the old one.
2. Mark the legacy interfaces as deprecated in their kerneldocs.
3. Slowly convert users one by one until the relevant symbols are no
longer called anywhere in the kernel.
4. Remove legacy interface.

A problem occurs when during step #3 (which may take anywhere from
several releases to many years depending on how commonly given
interface is used), developers continue to introduce new calls to the
deprecated routines. This is not always easily caught, because quite
often patches using the API of a given subsystem will not be send to
this subsystem's maintainer (Example: while GPIO core code lives under
drivers/gpio/, there are lots of provider implementations and even
more consumers spread tree-wide. I cannot possibly catch every commit
I'm not explicitly Cc'ed on and eventually some will fly under the
radar. Also: this is not a good solution if I have to manually object
every time, this should be more or less automated).

A lot of less experienced driver developers write their code by simply
copy-pasting from existing modules without checking whether given
symbols are marked as deprecated.

There are several things that look like potential solutions:
1. Use gcc's __attribute__((deprecated)) (Linus doesn't like it[1] and
with hundreds of calls to convert it wouldn't be acceptable).
2. Use keywords in MAINTAINERS entries (this sounds like an abuse of
what this file is really for and can sometimes be hard to get right.
Also: see above about it not being very efficient).
3. Make checkpatch.pl check the patches for new uses of deprecated
APIs (similarly to what it does for invalid usage of memory and log
helpers)
4. Make build bots detect it.

And probably many more I haven't thought of.

I would like to propose a discussion on how to enforce API deprecation
in a way that supports efforts to reduce technical debt, without being
hampered by developers and maintainers who mean no harm but simply
don=E2=80=99t know any better.

Best Regards,
Bartosz Golaszewski

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D771c035372a036f83353eef46dbb829780330234

