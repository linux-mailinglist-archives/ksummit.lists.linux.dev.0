Return-Path: <ksummit+bounces-953-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A1771DB7
	for <lists@lfdr.de>; Mon,  7 Aug 2023 12:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A16528121C
	for <lists@lfdr.de>; Mon,  7 Aug 2023 10:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81022C8FB;
	Mon,  7 Aug 2023 10:04:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C1C2D6
	for <ksummit@lists.linux.dev>; Mon,  7 Aug 2023 10:03:59 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d13e0bfbbcfso6218149276.0
        for <ksummit@lists.linux.dev>; Mon, 07 Aug 2023 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691402638; x=1692007438;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xRGzli2lAUffxtP9ALYDIx5sqFXQ0oqdxSDgCig8T+U=;
        b=KqAIibmwl0yYvuW1H9sCI/ljIXbbS4KoY3ibuNKDaRqqW8x8+WUCe7LUjKogmG4sLU
         lPvWyXDFRvQH3GhihDye6E+ZeRDzq7vZN6n0Afwf+NoioK8Hs4semAhUgoktZhc1oECt
         LQ0Mmm+yrine7hekslKnkGGsH64n7GCeEihq/Vhusyjrhxm/aQHYwGLSJR9PzfONdwu7
         QQmkgqf/IQ4pjjuVqw4l9uVlTva7G3HoYCMD7uKfzldM4gcBidkPywEdu7eCY/6/9UWY
         eT2ObzrM0ZQKXNzG+t5ftxE6ENDZZeOt2AW2DaIPvHlKPtkitQkO2r5UWitY18GBY6ZX
         8huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691402638; x=1692007438;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRGzli2lAUffxtP9ALYDIx5sqFXQ0oqdxSDgCig8T+U=;
        b=CgER9OQSC6A702xRR/f+2dbbkLnLEdLQMrDCj2arIYRLX6ZSOxzPNsSxl7E8+clhL6
         AWQek97xnyRfgvX2jC3uaobwSXhdb08R9Nlaw0WGr/kPSipKYMccmPqQjymq+Mf0Mk3w
         Jncznd7S4wT8XfDENnyImAQSVXpe18CDDGRDXWYaRwNTgj0DhhCPFJ7V23c8FLPr5CZt
         dcrlM55LhPRrQvX5us3jzB0g2ASlsnu79LX3zoNntys+TRuVBlLYCiDQEFLfXIRy+9F4
         +UyLjoMh/HURbMzWEU8kERMFz7mWTjzRI2o/SvdBAXNOwI8sTBHwGuls8liH78Wcjzfa
         L0CA==
X-Gm-Message-State: AOJu0Yx4S8LOJcXcmjnonf0wAnaq5YLPkHQkmHe0EZyBrbsKonGfnF8q
	utXNWbeg/P9TiI+qKz0KeUfZ90ESMRQBFNFbA3daK7kqQAk=
X-Google-Smtp-Source: AGHT+IG5DS1IeUCZJKFTVkoCZUuJR+sX0qdch0oAEFY01E7WVn0/GvKWy7+977Lmhm4gysYQm25nn8+cCz4eJJvIVYQ=
X-Received: by 2002:a25:8452:0:b0:d4b:a962:76a3 with SMTP id
 r18-20020a258452000000b00d4ba96276a3mr6364367ybm.29.1691402638626; Mon, 07
 Aug 2023 03:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Aug 2023 12:03:47 +0200
Message-ID: <CANiq72nPJVa51zv+_5tTX_jC=WGf9qmFkAHSJxkU-Y=e-5A5XQ@mail.gmail.com>
Subject: [TECH TOPIC] Rust for Linux
To: ksummit@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

This is https://lpc.events/event/17/abstracts/1602/ (submitted
yesterday, but we just recalled the mailing list requirement). This
talk could go into either the Kernel Summit track or the Refereed
track.

Rust for Linux [1] is the project adding support for the Rust language
to the Linux kernel. Soon after LPC 2022, the initial support for Rust
was merged into the kernel for v6.1.

Since then, there has been progress in several different areas,
including the addition of safe abstractions around kernel
functionality and subsystems, as well as infrastructure and tooling
changes. The talk will give a high-level overview of some of them,
such as:

  - Core: `Opaque`, `CString`, `ScopeGuard`, `concat_idents!`,
`{static,build}_assert!`: basic functionality that is widely used in
Rust code.

  - Kernel primitives: `Arc`, `Lock`, `Guard`, `Mutex`, `SpinLock`,
`CondVar`, `Task`, `workqueue::Queue`: exposing existing C kernel APIs
as zero-cost and safe Rust abstractions.

  - `pinned-init` API: a solution to the safe pinned initialization problem.

  - KUnit integration for Rust doctests.

  - `klint`: a tool to introduce extra static analysis passes,
including an analysis that validates that Rust code follows the kernel
locking rules by tracking the preemption count at compile-time.

  - Rust generated documentation at https://rust.docs.kernel.org.

Now that the project is developed in-tree, we will also explain some
of the changes to our workflow too, such as our branch setup, the
policy around unsoundness issues for stable kernels and the Rust
version upgrade policy.

Finally, we will switch our focus to the future, where we will briefly
discuss what is coming up imminently and longer term, such as the
placement of Rust code within the tree and the build system changes;
and also try to discuss and seek input from the community on ways in
which we can address some of the broader challenges we have been
facing. For example, a recurring theme is how can we make adding Rust
to a given subsystem more palatable to overburdened maintainers?

[1] https://rust-for-linux.com

Cheers,
Miguel

