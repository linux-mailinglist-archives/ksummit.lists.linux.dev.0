Return-Path: <ksummit+bounces-227-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27F3B460F
	for <lists@lfdr.de>; Fri, 25 Jun 2021 16:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 73A041C0DB1
	for <lists@lfdr.de>; Fri, 25 Jun 2021 14:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A716D11;
	Fri, 25 Jun 2021 14:47:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A362FB3
	for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 14:47:41 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id d9so12796185ioo.2
        for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JOYR0N+oSRS8JumDmcMdoVNQVk9xEZD2yJJCU1C6+kI=;
        b=fCEsv8X4uipEsldQihax96kKr77SI6VYDURvViOcjAmUsmG78JNYCul/3mxPOjh11y
         Gic/pIveklggTd6b/JVUy1rCDrsfk7MV4vJEA2NtGaz8RlgiIFraEXWQ9NbDBTO8xOMa
         VVzxtWUw2uN7WoAMLW4A+RVZy/f0oKNVMH96DcrkgsIZjjyF1yB/Cd3bl9HiD8kU6M0w
         a/Ulx+nh4DXPDN7B6608RNONneKmHV3VKG1Y4GwlR8D4zoUGb9kb5hL/F1NdPxRihZ+G
         Uss0FNigWHs9WJF/BjLEZtTT3kGyn/E4dtF47c5VPSMHUDIvcQ4e6SA3ZEDJ0xSK5YiV
         8EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JOYR0N+oSRS8JumDmcMdoVNQVk9xEZD2yJJCU1C6+kI=;
        b=NR7qJVVS9EHh6/+tvNYmwIANJYBGvM/JGMvudoWxrBAnuTaJECcWJo8uJoQlYYJ1NT
         rKXMtUhYjgTOQnSPNa0MVzMCA4EjEXDVTVAgHR7CBgWSvzfZ10Te0CE4nt0f/sRTfJnM
         QkeL3FY2+kx5DFXBTS34nfqwxO8seyRxpwroSpbjnA6Av0UTucZbSD1GDsjmmQXsIJW2
         z2UP8Z9yGraJa1jxce4oixII1VO0Yy3a1B0ZlRHBUP/fGG8IPjEMIOYLzF1q5kV7d6x9
         TlBFJzd7+4D/OiCpelXlh4VbHC/6pBQuYSjAz3hDDKfQP/S7ULcAmXNjVvdMjE/R56z/
         Ck/Q==
X-Gm-Message-State: AOAM533h4C0exxQKJasfJT6akrxvLc7AEKSfwMym9oFdMAUZqbZKNtAz
	aFSaZbr4Os7CiYSdv+1V89RtKrIprJra91t115Kjpg9llWbdkA==
X-Google-Smtp-Source: ABdhPJyEvpJCReA9bk4huuWF3cpWVBZLphjyYw+t77vWg3oK4CfGDiFlMnSKQXZYO9UyZ4JRnRbpJgt6DdQZ+9pJvAI=
X-Received: by 2002:a5d:960b:: with SMTP id w11mr9096528iol.138.1624632460786;
 Fri, 25 Jun 2021 07:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Selva Jove <selvajove@gmail.com>
Date: Fri, 25 Jun 2021 20:17:29 +0530
Message-ID: <CAHqX9vZ_F4p0J_E3DZ4eoW0d3J2dZET5GEbM4Gr5wkUdRRPsAQ@mail.gmail.com>
Subject: [TECH TOPIC] Settling Copy Offload via NVMe SCC
To: ksummit@lists.linux.dev
Cc: joshiiitr@gmail.com, nitheshshetty@gmail.com
Content-Type: text/plain; charset="UTF-8"

The de-facto way of copying data in I/O stack has been pulling it from
one location followed by pushing to another. The farther the
application, requiring copy, is from storage, the longer it takes for
the trip to be over. With copy-offload the trips get shorter as the
storage device presents an interface to do internal data-copying. This
enables the host to optimise the pull-and-push method, freeing up the
host CPU, RAM and the fabric elements.

The copy-offload interface has existed in SCSI storage for at least a
decade through XCOPY but faced insurmountable challenges in getting
into the Linux I/O stack. As for NVMe storage, copy-offload made its
way into the main specification with a new Simple Copy Command(SCC)
recently. This has stimulated a renewed interest and efforts towards
copy-offload in the Linux community.

In this talk, we speak of the upstream efforts that we are doing around SCC -
https://lore.kernel.org/linux-nvme/20210219124517.79359-1-selvakuma.s1@samsung.com/#r

We'd extensively cover the design-decisions and seek the feedback on
the plumbing aspects such as -

1. User-interface. Should it be a new ioctl/syscall, io_uring based
opcode or must it fit into existing syscalls such as copy_file_range.
2. The transport mode between block-layer and NVMe. A chain of empty
bios (like discard) vs bio with payload.
3. Must SCSI XCOPY compatibility be considered while we go about
building interfaces around NVMe SCC?
4. Feasibility and challenges for in-kernel use cases, including the
file-systems and device-mappers

Thanks,
--------------
Selva & Nitesh

