Return-Path: <ksummit+bounces-654-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0E5506AC
	for <lists@lfdr.de>; Sat, 18 Jun 2022 22:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7E2280AA7
	for <lists@lfdr.de>; Sat, 18 Jun 2022 20:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2516533F5;
	Sat, 18 Jun 2022 20:33:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8937B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 20:33:12 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id k6so530857ilq.2
        for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 13:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=JHUFXP78NlsaE80dpbFV9d+d689oBJTlKYJMp02zRGI=;
        b=q4tN85QKID5SJyMhF19PXzadZSxpeNsugcpB9lIN24SDaWkalRBJgRMOirn3tpD+WT
         gIY6FV8M+ubeKrLSmgYSVuJh2NMzB3QhihE291K2vG/GqXizdmt58aII0jIL5EEaq4qO
         NUeZRmjWIts+WfgNFj/Fbfn3nRNJzUlefG7LsUtaL3BHHAIaGKlmkz/vNWm11IIW2UBM
         pJGZWFHar23D/q6e1ipi2imX3Hy2zoM1XCxFqolyghYd/3C0JwIlmYzkNSa5X0YDhOwF
         TtHGOxAqt7/3RXN0rvdVOmHJxCa69iMJfvz+3Rp16dU9EoHmZXxxqItI06keOfMAQqJz
         zCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JHUFXP78NlsaE80dpbFV9d+d689oBJTlKYJMp02zRGI=;
        b=W3ZtN2bAN1tSgtpgkWSxzo79iQ126S2N1ZBvaraRD3aO6BVVQ0BIwkHHZLBx5WnuK7
         KXbwLuLWiCOno9lTF5qPpeuA96WkS70TON4JTmp2gXOx+hE/g1iWCmP5CrvanccwZ4Jd
         IBG2UUKm636K44typTJczaiUS9yWjlE8Os4XoEK0lzn/NdGKsarhBzsPwcLX7KpjXsGN
         NY9gbt4fidb7T7WGZPxFWUVFSADNTlW7y//iTdozLer5YeBPAmmwqK21y19seDmwoYvO
         QYocAt5tmIH/VGuuWEwfy0liX7FixXBvkWsojf2odRbCnX7HIyTP+GiIwPOWep6BKC0N
         vFMw==
X-Gm-Message-State: AJIora8RDPDOcbYpPH/XpRd0Jvwkw5nEiIbAjxgpnYQ68QXBdNIrM82S
	CpJ7l6cWgmFLJMuhIv4AjecgzEvdJKFbAhUk/kr+7S4P0pI=
X-Google-Smtp-Source: AGRyM1tyngIeb4MEVp1+lzLR3zcWr1ZFZcoZcBTjn+9eyyEw1apYl7dJXc9lCEwQuDxJjRWQPJ8UXwpRMgE6CILeMYM=
X-Received: by 2002:a05:6e02:152f:b0:2d4:980:a529 with SMTP id
 i15-20020a056e02152f00b002d40980a529mr9290924ilu.72.1655584391971; Sat, 18
 Jun 2022 13:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jun 2022 22:33:01 +0200
Message-ID: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
Subject: [TECH TOPIC] Rust
To: ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The effort to add Rust support to the kernel is ongoing. There has
been progress in different areas during the last year, and there are
several topics that could benefit from discussion:

  - Dividing the `kernel` crate into pieces, dependency management
between internal crates, writing crates in the rest of the kernel
tree, etc.

  - Whether to allow dependencies on external crates and vendoring of
useful third-party crates.

  - Toolchain requirements in the future and status of Rust unstable features.

  - The future of GCC builds: upcoming compilers, their status and
ETAs, adding the kernel as a testing case for them...

  - Steps needed for further integration in the different kernel CIs,
running tests, etc.

  - Documentation setup on kernel.org and integration between
Sphinx/kernel-doc and rustdoc (this can be part of the documentation
tech topic submitted earlier by Jon).

  - Discussion with prospective maintainers that want to use Rust for
their subsystem.

Cheers,
Miguel

