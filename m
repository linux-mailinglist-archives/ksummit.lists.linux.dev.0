Return-Path: <ksummit+bounces-232-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F973B4A76
	for <lists@lfdr.de>; Sat, 26 Jun 2021 00:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 4CCCB1C0E5F
	for <lists@lfdr.de>; Fri, 25 Jun 2021 22:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10FB2FB8;
	Fri, 25 Jun 2021 22:09:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B0168
	for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 22:09:11 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id p133so6896499yba.11
        for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 15:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gfx6af2MxVNj970c4PxdNQDfFHnpvml5fODOk/bM/js=;
        b=sonFCwHpmyT7uBpbZWuxXwXyDbJXyB2RV9xQ6gGcWwg8DYYR2j0gwHyei6ESTmpUIS
         e479pd44OB7jlCv26pE9bWLOC/sOInGv0n6u6bQVO9CSaE8AjxnoqlST8fV6HhKWuAdj
         wzML53cz9fyUZanImb5otjmB8AtDcd+NuSzmkhQa9eymX+8YZwRwgYB9V9FC+L8lxK+a
         +gF4tHuR1IxQ2Va9XJFZ2zrYSO5cNTJHHDaA9V+QSBqjwwom309ytc1qHEfMsgPQoj2+
         WwEwoNqH4Q5yYMlYO8jxqb5p2VNQMj1SFMw5XaL1a599ktx8/YtU1DEwp/a/fA2mh9xP
         V0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gfx6af2MxVNj970c4PxdNQDfFHnpvml5fODOk/bM/js=;
        b=jyR5MlWOw61UyaWPUtQlwcB5OvqA05cZh9/zxZ5v/FGCBzzZecqnOrkCn47+3sUqUH
         afheEz/l9KDhTNscGa+NxNuFsA5VusYjMleAgiD19Bpui+UuUbUqH+qQhwwdo7dx9IAB
         MLrxWaxBAsZW8ri5anaajjvP9DHryfUPwAiGk/q7VNvgaqW/5/tMgaZjokSv77rkXvtK
         plKSwT0HvCsQksDWHjPYfEtBLZydgntWFM/ozFkSyhoKf7v4oZArjUbgOt3Xh1wl0FWF
         GhRtWGExQBVCRvS0bls96gs9PzB9Te9IwNibKrRze/TONEMD9mbsniQciTOSKcwYZihu
         XL9g==
X-Gm-Message-State: AOAM531yOrQ67XD447ypOAcOGKIqYw57llOWq7d1Xb72UmQUAh00kmId
	DIwEIfMfa8c2tNqRNvlzYy2QMQX1BQcKEGimNs8doeRKmJSHiQ==
X-Google-Smtp-Source: ABdhPJyn+egyDakIgnXBJgSxGuk5IJqLaER2jUiA+l81e1N0X0arpOnwSmwAqg+R+6f+Hoa1da5eWaxh7PyU6BHo6XU=
X-Received: by 2002:a25:33d7:: with SMTP id z206mr15094612ybz.33.1624658951171;
 Fri, 25 Jun 2021 15:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 26 Jun 2021 00:09:00 +0200
Message-ID: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
Subject: [TECH TOPIC] Rust for Linux
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The Rust for Linux project is adding support for the Rust language to
the Linux kernel. This talk describes the work done so far and also
serves as an introduction for other kernel developers interested in
using Rust in the kernel.

It covers:

- A quick introduction of the Rust language within the context of the kernel.
- How Rust support works in the kernel: overall infrastructure,
compilation model, the standard library (`core` and `alloc`), etc.
- How Documentation for Rust code looks like.
- Testing Rust code (unit tests and self tests).
- Overview of tooling (e.g. compiler as a library, custom linters, Miri, etc.).
- Explanation of coding guidelines (e.g. automatic formatting) and
policies we follow (e.g. the `SAFETY` comments).
- How kernel driver code looks like in Rust.

Cheers,
Miguel

