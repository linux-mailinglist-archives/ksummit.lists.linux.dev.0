Return-Path: <ksummit+bounces-1191-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1FB7AF625
	for <lists@lfdr.de>; Wed, 27 Sep 2023 00:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C5893282A6A
	for <lists@lfdr.de>; Tue, 26 Sep 2023 22:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DDA4B201;
	Tue, 26 Sep 2023 22:04:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE482E624
	for <ksummit@lists.linux.dev>; Tue, 26 Sep 2023 22:04:56 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59f7f2b1036so64359717b3.3
        for <ksummit@lists.linux.dev>; Tue, 26 Sep 2023 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695765895; x=1696370695; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwa5UP1PHisVGGsuL+rms3LI5kmclyl4krR13d/uVk8=;
        b=M4t3L2qnFxci27tLirRoDo8X7J8rSglbCV9SJXl0lFaxNj/xvMWI8UP+yyNHkJhy17
         B4gP6PCITBuv732ShISk5rCPyCDcwzYw1+wgMTX8nbf3ZzeQ8IgTBLAAAoyjqU190CUu
         tjHxTZOkp36XgqtsWA0rK5gFKuUqh2gHKl6Ulseg6u8PioC2be3EB8s6zapfzvGc344v
         kIylPxCZnFxnOpbq4l6TyRdMkADCaolPE5yFgvec0Mw+uuveFvgo5eGfSDqqCt9YWHiA
         aa0QwCvIlf/k2j/rM4Mq94Ju6AI6uHQaQcpOfwlk5gxVr8E1GF1RaDyu4IRTNGFjaUX2
         3feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695765895; x=1696370695;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwa5UP1PHisVGGsuL+rms3LI5kmclyl4krR13d/uVk8=;
        b=KqfCnkLCGcpxN6IkeTKIPvvMZ/ck2AOKejPZyFN9fc/glJh/n53ksWvg+G1+dcl4TQ
         N8xnVhAAKFdcY4cTZbUnQ9W6Osf7LGPm17+XRWugg5RgyEec2tc0I9Mhues3hVtLqnBx
         4YYWG2H12STHV9fGNj3tjNgG5XtlLxO3exvIN/ZDuDyERNH5TEd6Kza3luB/S8it7BHW
         s8ybLymOAI3hrZrdrZ/fUSV1OnV02ub3BVVdTeyDzk9Gtp9Gu0fps0jlKua0x0F3fljL
         PJLsWY3YEc/4+lPB/fOnYxEEQKd6S8lvMOLp2zeNFCugP/ZeMIKSCPNqdEn8M6HSgf/5
         o+Xw==
X-Gm-Message-State: AOJu0YwQr4APMPQYQUO5NMOwuyXSR6yK87NWxD8TCP4ZnxPNscD9Iy7u
	Pd2dHMnYiRkibwOx9doOISmOeTVc6bkt/rlFbklNSYJy8hLCnA==
X-Google-Smtp-Source: AGHT+IHFm+EOeFmXTR2lA7tiGiiNaOt9YcPcPML3IVVpmLm6ArazTpfGjOBTbUX4Rk3NJaF9xGjtRwe1qkhnwofuORg=
X-Received: by 2002:a81:6e42:0:b0:57a:5c79:482a with SMTP id
 j63-20020a816e42000000b0057a5c79482amr269889ywc.50.1695765895412; Tue, 26 Sep
 2023 15:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Sep 2023 00:04:43 +0200
Message-ID: <CANiq72=99VFE=Ve5MNM9ZuSe9M-JSH1evk6pABNSEnNjK7aXYA@mail.gmail.com>
Subject: [MAINTAINERS SUMMIT] The Rust experiment
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

In a few months it will be a year since the Rust experiment in
mainline began. The first major users are getting upstreamed and more
companies are publicly supporting the effort [1]. However, when will
we consider the experiment successful (or not)? And how can willing
maintainers make the most out of the experiment?

The first question is important for companies and maintainers to start
investing in Rust. It is also tied to how we can resolve some
chicken-and-egg situations in subsystems. For instance, a few
maintainers are open to the idea of experimenting with Rust, but they
may want to start simple with a driver they are familiar with. But
such a driver would violate the "no duplicate drivers" rule.

Similarly, external people have expressed an interest in writing Rust
drivers, but given the required abstractions are not there, they may
decide to wait. But if nobody writes a first use case, the
abstractions cannot be merged without breaking the "no code without an
expected in-tree user" rule.

A potential solution to these deadlocks is the "Rust reference
drivers" proposal. The idea here is to relax the rules temporarily
(meanwhile the Rust experiment goes on) for willing maintainers that
opt into it, so that they can have, in-tree, an equivalent
implementation of a real, paradigmatic C driver of their subsystem.
This would allow them:

  1) to bootstrap abstractions for new drivers, i.e. not the
     "duplicate"/"rewritten" one, but future new drivers that would use
     those abstractions; while avoiding breaking the "no dead code" rule.

  2) to serve as a reference for existing C maintainers on how such
     drivers would look like in Rust, as "live" documentation , e.g. like
     how LWN featured a 1:1 comparison between a C and Rust driver. And it
     has to be buildable at all times.

  3) to use all the in-tree kernel infrastructure and to prepare their
     subsystem for Rust over time, e.g. setting up tests and CI.

  4) to learn over time, especially for subsystems that have several
     maintainers where not everybody may have time for it at a given
     moment. Reading Rust patches from time to time for APIs one is
     familiar with can help a lot.

  5) and, most importantly, to evaluate if the effort is worth it for
     their subsystem: how much can we write in safe code? How many issues
     has the reference driver had over time vs. the C one? Did Rust help
     prevent some? How hard is it to maintain the Rust side? Do we have
     enough resources in our subsystem? etc.

A "Rust reference driver" does not necessarily need to be considered a
real driver, e.g. it could be behind `EXPERT`, be tagged
`(EXPERIMENTAL)`, staging...

Some of this could be done out-of-tree, of course, and in fact we have
been considering maintaining `rust-*` branches for particular
subsystems to alleviate this situation for those users that want
particular abstractions and to coordinate everyone in a single place,
similar to how we started the Rust effort initially with our old
pre-merge `rust` branch.

However, the Rust experiment could be much more productive if willing
maintainers would be allowed to upstream and develop their
abstractions in-tree, just like the overall Rust support has been. In
other words, we started small with the Rust merge a year ago, adding
small features over time, and now it is the time for subsystems to go
ahead and let them do the same.

To be clear, this is something that maintainers would opt-into, i.e.
they know they are investing in something that they may not pay off
and may need to be removed. But that is the point of the Rust
experiment, after all.

We are trying to find a compromise that can work for everybody
(subsystem/driver maintainers wanting to start with things they know
well, companies wanting to use more Rust, external people looking for
"example code" and "what has been done so far", etc.). Last year I
asked for a bit of flexibility from everyone when required to make
progress: we do not want that people take this as an excuse to break
the rules or to give the impression that "Rust is going to be
special", but this may be one of those cases it could pay off.

Thanks!

Cheers,
Miguel

[1] https://rust-for-linux.com/industry-and-academia-support

