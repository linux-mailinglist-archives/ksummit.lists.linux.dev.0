Return-Path: <ksummit+bounces-641-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A84A605B
	for <lists@lfdr.de>; Tue,  1 Feb 2022 16:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 3F2D11C0EA4
	for <lists@lfdr.de>; Tue,  1 Feb 2022 15:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F4C2F33;
	Tue,  1 Feb 2022 15:44:05 +0000 (UTC)
X-Original-To: ksummit+subscribe@lists.linux.dev
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F82CA6;
	Tue,  1 Feb 2022 15:44:03 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id x13so16616893vsl.10;
        Tue, 01 Feb 2022 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=XlaBX5xf2kC2PYFh91EO4ufBvcLkfsBOS665OsIpRa9DQkpb7u+LxrdpNGJzxoAnJ0
         6Zrb97yEFwak4wNM5a0BjH3AdPWqIlAwjxrNKkSzysr8CFAIoYhUPvJm6Qcznt67FGJa
         7c9Sj9fxgdbh2vhCp424CZvvJ1UrpoZyojJwNagTfy7FdayiBCXf6mVeEEvxUs5vhht/
         f371R1RqGkTBAQFf/gEHEAhojKs0nS5FarjH5vHJG+n5BYFkMvHQorqXLR+d0iWDZ/HK
         EHDUCIDj5zcbSEABUPNFWoSmIlD5wghMJe3kzeG7eFpipQf7kXFiZVWg4C44VU3TC3nw
         cf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=zGWqDVvgo3fGsbJUB2qbvIbUvH3FmLFGHUe7O4oCMYpBJrFkJCMIFK//PeeEY27dNW
         FJVH1D5lPoQIz/HYt1J6kvF3pumRsxJkVeDU4C+xGHfUTDHjzdDZ8Uq1yx/0rOlveP4T
         OqlidV41qr9eNTbit0xjltpYkU8QE+ls6bENMCclSvCx05KpvL/Ar/ZVXM88n0WgBAsY
         +GroZfSt5PL4L5Ci1iO9pDFt2A7B9n4uPRi28XozFi78gmHfKEqDBDz/U38CEePTzvPV
         YgTe9grvQVGyD4R9AUGkfYdVM7kI6c1zcD0gfTmAfx1A0Sbc6mrVYsNFvC/PZCbJDXyr
         C0EA==
X-Gm-Message-State: AOAM532vhLytiotCRPAVTS3NkTMQHmEYmql1TzuqJLZI0zqU5xd8LK1I
	GvHOROknFivWqBaI3vJmXBH7IStEIbb3TxGL5j4yUdNuUQuRxbH4ZY2xgQ==
X-Google-Smtp-Source: ABdhPJwhlWLLV81lekh4LZE/fQYhJPXbW4owMGw7muEEAo0II3hymR3KzIUfuse9+LlQjTToAGFxAtsFrBNFhnqhg+w=
X-Received: by 2002:a67:ca0d:: with SMTP id z13mr10443702vsk.9.1643730242915;
 Tue, 01 Feb 2022 07:44:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: sanita retan <sanitaretan@gmail.com>
Date: Tue, 1 Feb 2022 16:43:50 +0100
Message-ID: <CABLemWhTUqqM=_vEScEc6i=rEAnhtUrQm6-XQOgAxrr3A8p5Qg@mail.gmail.com>
Subject: subscribe
To: sanitaretan@gmail.com
Cc: chrome-platform+subscribe@lists.linux.dev, chrome-platform@lists.linux.dev, 
	connman+subscribe@lists.linux.dev, connman@lists.linux.dev, 
	containers+subscribe@lists.linux.dev, containers@lists.linux.dev, 
	ell+subscribe@lists.linux.dev, ell@lists.linux.dev, 
	iwd+subscribe@lists.linux.dev, iwd@lists.linux.dev, 
	ksummit+subscribe@lists.linux.dev, ksummit@lists.linux.dev, 
	landlock+subscribe@lists.linux.dev, landlock@lists.linux.dev, 
	linux-coco+subscribe@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-staging+subscribe@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-sunxi+subscribe@lists.linux.dev, linux-sunxi@lists.linux.dev, 
	llvm+subscribe@lists.linux.dev, llvm@lists.linux.dev, 
	mhi+subscribe@lists.linux.dev, mhi@lists.linux.dev, 
	mptcp+subscribe@lists.linux.dev, mptcp@lists.linux.dev, 
	ntb+subscribe@lists.linux.dev, ntb@lists.linux.dev, 
	ntfs3+subscribe@lists.linux.dev, ntfs3@lists.linux.dev, 
	nvdimm+subscribe@lists.linux.dev, nvdimm@lists.linux.dev, 
	ofono+subscribe@lists.linux.dev, ofono@lists.linux.dev, 
	patches+subscribe@lists.linux.dev, patches@lists.linux.dev, 
	regressions+subscribe@lists.linux.dev, regressions@lists.linux.dev, 
	linux-somesuch@lists.linux.dev, postmaster@kernel.org
Content-Type: text/plain; charset="UTF-8"

subscribe

