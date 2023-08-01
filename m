Return-Path: <ksummit+bounces-952-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1B76BC11
	for <lists@lfdr.de>; Tue,  1 Aug 2023 20:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090302819B9
	for <lists@lfdr.de>; Tue,  1 Aug 2023 18:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E578235B6;
	Tue,  1 Aug 2023 18:13:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007F623589
	for <ksummit@lists.linux.dev>; Tue,  1 Aug 2023 18:13:11 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bb8a89b975so35736335ad.1
        for <ksummit@lists.linux.dev>; Tue, 01 Aug 2023 11:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690913591; x=1691518391;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRmLhxWwXQg1xz/UHO46Z1b59y11aggBFDfPzRx8pds=;
        b=Pbqse/vHlh5rPlzzVsu6+Hk4dMtTFzeT8QQ7ry5KjAx19PnQDqWozMlb8k0aDxAeN7
         ig5ZjmH9Sr7G6igP/6ql6etpvbqo3tq8XpkQr4tylBdePhAmTbikxWwrLPNnxPyA6arW
         hy4Dx+IaAdR220GLkyzNUe41RQDhUBUWWrV2un2bjBhLsLvweDfjeMwUjzR3y7KRf8uj
         uUmAntbFt7PGFnvB7kWyq4QlemUZbI9fBtFqoXecGc6SoO7n3ETOOESOyJJ3gJEJOq8T
         MzH6oG44uWVGH2CdyMM9jVCufuH743icmWF0a9BdsFQbwZe5J3/PsrFSG9BCdxP1zetb
         J8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690913591; x=1691518391;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRmLhxWwXQg1xz/UHO46Z1b59y11aggBFDfPzRx8pds=;
        b=Irf/6f95twcxoSW3G04jWN9UehfPrQqDnVyM+JqyiV4jiV2hcK6Pvlct9+H5HFjNdb
         g7aPL5nynhgSYgm24nOi4QJOMxT6/iKshyrydLFVKa64RxqdViL4G+l0UWF073sqxD+p
         0YQ/t+TaqK+aCdKzmp3kXIfZXuoHrgUcuu8UvgQuczZr2zu4RoojoH38cqEV04oPF7wA
         hozzKGg0FSlh0wJMSleHD11DENaosKihcYxcQBkg5Df0RXjfaxj64CuvUgLKh8fwZR8+
         8/rACcnhlUDrJXljMnxOHijJcl5Baiy9qQ7UHYE3gl1GRP96sdWW+DjQS8DcJUbOuS52
         oN0Q==
X-Gm-Message-State: ABy/qLbR/4KPINEuLCQ+mLgCJR9b7NAjwCz7ZUFKjhh/JGA47Nma2Vs4
	f8LA9FZkhV1/nbqBa7bvlrJo8+phEb+uDEBS
X-Google-Smtp-Source: APBJJlHxvnIo8LXuyE6N5wAg+XrlfJVDEB9Ik+/YqqeM0ApFzuF+qkQOWH5NTnP2xSNikmh4wov0iw==
X-Received: by 2002:a17:902:ecd2:b0:1b9:da8b:4eac with SMTP id a18-20020a170902ecd200b001b9da8b4eacmr14521447plh.56.1690913590647;
        Tue, 01 Aug 2023 11:13:10 -0700 (PDT)
Received: from localhost (ec2-52-8-182-0.us-west-1.compute.amazonaws.com. [52.8.182.0])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902b18400b001b8b4730355sm10767389plr.287.2023.08.01.11.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 11:13:10 -0700 (PDT)
Date: Tue, 1 Aug 2023 07:06:28 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: ksummit@lists.linux.dev
Cc: bobby.eshleman@bytedance.com, amery.hung@bytedance.com,
	cong.wang@bytedance.com
Subject: [TECH TOPIC] VSOCK: From Convenience to Performant VirtIO
 Communication
Message-ID: <ZMiu9Mkdg4wHtCs7@bullseye>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Below is the abstract for talk we are proposing for LPC2023 about recent
work and advancements in the VSOCK socket family.

Thanks in advance!
Bobby Eshleman

Abstract

The VSOCK family of sockets has traditionally been embraced for its
convenience in enabling communication between virtual machines and the
host in virtualized environments. However, recent practical advancements
have developed VSOCK into more than just a convenience; it has become a
viable networking protocol even for some extremely demanding networking
workloads across the host/VM boundary.  This talk will delve into
virtio/vsock and its new support for datagrams, unlocking new potential
for efficient packet exchange between VMs and the host. By comparing
VSOCK datagrams with UDP over virtio, we showcase its practical
performance advantages, making it a compelling choice for
high-throughput point-to-point socket-based communication scenarios.

Additionally, we'll explore the integration of sockmap for VSOCK,
empowering eBPF programs to interact with VSOCK sockets within the
kernel. This capability allows for dynamic socket management, providing
the ability to leverage the performance advantages of both sockmap and
VSOCK in the same practical applications.

