Return-Path: <ksummit+bounces-655-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF55506B2
	for <lists@lfdr.de>; Sat, 18 Jun 2022 22:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6124A280AB8
	for <lists@lfdr.de>; Sat, 18 Jun 2022 20:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F00933FA;
	Sat, 18 Jun 2022 20:41:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0BF7B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 20:41:02 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id h8so7665153iof.11
        for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 13:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Snkh9pGJOPf3L+BsetMCm1Sd5RITyLczHGdsHabqlcs=;
        b=c86bVaqykQPLPv6BdZQtFtk9aYgPUnlp6pvt28avWce6umLhnQYbMdRn7YRZ4e7fcr
         hJcgQB7PkuEUd+4kVS0H1e2Bm+4iEhwJMPJ33rRwN0+zs1SiYsOFtz2Q+Xql+9yT22nU
         8Iai92elc8/8ffG2/bkEbdGB1wRmI71KhIm8utE+FZRXjpgmi2k3KNgD3neUHV51D1qi
         UypGwIsXaoUBVhDDxHqFDF/GoToN2irtu3HINvbcdUh1/zOAXh2zdUoUml9K9RUwTRQy
         djJ7zHh1ntp0uD99CYNUj1aufkclkKl0Y2hXud3zkPoTvy1TUTIpNSM3jMeM+wEkQ0md
         t4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Snkh9pGJOPf3L+BsetMCm1Sd5RITyLczHGdsHabqlcs=;
        b=F03wrpkHiqG1mn2pKPTbkQZa96Ab//gm7oOv4wSIRe3ZzNt95Q+spd8fJUrEuQhFsg
         5ZZmlAB9wgqaMG2+xLsFFFY2l219CYjSE85wrOotn7LdaaO54Y3G7sfdy2Ycf3dr9svr
         c9azYELRYC1niIJ/wsaX8vj+pPP4Y5V56ewDF023L8QtuC9CZL3EzsD5KB7s1YA2hP3A
         nYYNPc0w7l3T2ZPThPUaOSRdoU2QsyYNvM957W+G0AX9zyQ4ReMBfirab5X+GoIyGkM4
         6NKPVvwGuqeG4IU5mtQ3dia68bwg9E/TwK4OEuGdq2BFcT6bdhsSNx2TLypTJbP8z3IT
         CmbQ==
X-Gm-Message-State: AJIora+5V1b2TACmW71pQFCCPYS36JtRHwCu+oc0stqShrdEaQ9dDPqP
	qyH1KuRkTZqwPZZRGP/DMC9PYZfydtY8tlSMdt+9l+Pzj/w=
X-Google-Smtp-Source: AGRyM1v06/OAl/dUw/x25Un3V4bbDY783/BTCnIK9OycjlAO6gg0UFmaBGmiTQBGDWnjcy3j6nZktXpuFrpEh5snm8w=
X-Received: by 2002:a05:6602:2d44:b0:669:ef11:523a with SMTP id
 d4-20020a0566022d4400b00669ef11523amr8264454iow.44.1655584862090; Sat, 18 Jun
 2022 13:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jun 2022 22:40:51 +0200
Message-ID: <CANiq72=f74aeWR6qauCy4dtHQFL3SnF222y=5VuZ2o7afx77_Q@mail.gmail.com>
Subject: [MAINTAINERS SUMMIT] Rust
To: ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

In the upcoming months we intend to have several important discussions
around Rust in the kernel, such as in Kangrejos and the Kernel Summit.

It may be interesting to revisit some of these to decide on policies
around Rust -- see for instance the Rust tech topic proposal submitted
alongside this one:

https://lore.kernel.org/ksummit/CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com/

Cheers,
Miguel

