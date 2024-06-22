Return-Path: <ksummit+bounces-1355-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76C9135D7
	for <lists@lfdr.de>; Sat, 22 Jun 2024 21:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C46B31F23D66
	for <lists@lfdr.de>; Sat, 22 Jun 2024 19:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524583BBF0;
	Sat, 22 Jun 2024 19:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGHDyhxI"
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E5B381AA
	for <ksummit@lists.linux.dev>; Sat, 22 Jun 2024 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719084064; cv=none; b=P/pn8yac/ouRsP0TmaSMpiM+kVY9oYDBZkd/aoJDAlwvU7vzBc0L4IVCvcqTWBkLXX3DyFW7M1cFM1U70vSH2WSUIB/FIPXzujAXGMkktiHH7AExxK3J7cA6UkqcCxVX0CiTjJN0u6UNDEEoI+X9/pk4P6KLmuVdCuaBIGSVT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719084064; c=relaxed/simple;
	bh=Uw0WcoG8Djy6QArlamlId0DlaiklJJPtLnN4w5IlHEk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nyTKUIuMBr6yEEZRdo+lVd7RNGLal1zR6M/pQbXwcJNQ4qV57ApsS/rJU07lw+QMRItSFwxZCOZs1kXwsoIuvtW6bUAQe/FiL0L/ArVVhN9bqJ3VsIr0/6tpal5JCwKTjCfBpQJyauczfWjG5c65qbbMTMm77Su9v61TBc8dt88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGHDyhxI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso293115b3a.3
        for <ksummit@lists.linux.dev>; Sat, 22 Jun 2024 12:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719084063; x=1719688863; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Uw0WcoG8Djy6QArlamlId0DlaiklJJPtLnN4w5IlHEk=;
        b=mGHDyhxIxOVGuueqp3sbam6inTNpfYgRt6H4GpZXRiKaEt+DV8o5oxdrWGkAlazq76
         V+u2YihVRbGkeEDzU7ghgrja/iqqCiwbMp1pXGtBtl5Z+jhRICSoEXbIvxthEP7hAhXu
         Sdn0RAqDezhel815r+RfimK6XaCODSJTE/rLCdOqN6WgfiiU5E3SLOtAeIB4SG2IOsr1
         iv8Nq6M6Qjb8Ej7MxfVEDmjqp7+se+jHb1Z6YA7M/DPoGfp0vV7ZOgEVwrHibihz61Hi
         D9h8ztjWhKcJB8TykQ3iTXBwcprctXNDFwySB2QQsMYOUED7mbF07TK/0eUmppVlR1it
         1APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719084063; x=1719688863;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uw0WcoG8Djy6QArlamlId0DlaiklJJPtLnN4w5IlHEk=;
        b=bBNpwmLHebVimprJoYyI8VHbXXLdSCSZnPst+BR5n552i3yWsVOSpN7d68P0CRIwmR
         KjRC3GNp9DlS46JQCb/Pjcvjp2JXa/iBQ0rkLuyFMKebjfnjxcHgY/ydwYUhKxN4qZZs
         wm8XIplnPFVzKa0nk3WEMfYkEnAjIDAg7P5axta4ovJnSDoI5GcKVrP0V4TOnIrcDRFB
         FYRykdsaVx19ZFXkpbjSOLr2xV00YgxHin87Ov7CgNB1+u+4pGBVSnuenQXAM3pEX0gc
         gSzIhdhFNkJ3pUbRIiwINh2cXIIpBoUJ3ljh/p58iSDlu7QQ6gHPK6Vvj+SWOKyEXplD
         9Gww==
X-Gm-Message-State: AOJu0YzXlQrUGZ8UCXSHTAtkTdZFnZTnrglJuYerdyhnvsY1eiTcI/Au
	P+EY/kydlm20u9EVT4v6xpEVvsHyKaUDxLKooDFt8HO376Rf6JyftV/yueLbiPMUqGGedeXQuYq
	OFA8QTxmShoKB8wLCMs+C9hs2AHzg07kksf8=
X-Google-Smtp-Source: AGHT+IGV1Pdg6Fo9sTUDPPOChvKKq0IksmHFZWuiJqW6tvxcS2uzaABq48l4O0sQMBYAChYXhW6BLbbrYX3pLw2x/XI=
X-Received: by 2002:a05:6a20:4e22:b0:1b5:8ab9:9a24 with SMTP id
 adf61e73a8af0-1bcee738f45mr1167904637.35.1719084062626; Sat, 22 Jun 2024
 12:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Jun 2024 21:20:50 +0200
Message-ID: <CANiq72kXQ-WSaAfzWec_6-xoZh+SmGO=H2=R2Cu29b-GFu=nJw@mail.gmail.com>
Subject: [TECH TOPIC] Rust for Linux
To: ksummit@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

This is https://lpc.events/event/18/abstracts/1937/. This talk could
go into either the Kernel Summit track or the Refereed track.

Rust for Linux [1] is the project adding support for the Rust language
to the Linux kernel. This talk will give a high-level overview of the
status and the latest news around Rust in the kernel since LPC 2023.

We will start with a summary of the new safe abstractions, modules and
architectures that are in mainline or getting upstreamed soon. We will
cover the different strategies subsystems are adopting to ramp up the
Rust support and the policies for dealing with mixing C and Rust code.

Next, we will cover improvements in the infrastructure, including the
new build system: why we need it, how it differs from the C side, what
features it introduces, the `kernel` crate split, etc. In addition, we
will talk about third-party crates, https://rust.docs.kernel.org and
kernel CIs.

Furthermore, we will give an update on the unstable features: we now
support several Rust compiler versions, which allows several Linux
distributions to work out of the box. We are now collaborating with
the Rust project to get the kernel into stable Rust. In particular,
Linux has been included in their 2024h2 project goals and it is being
built-tested in their pre-merge CI.

Finally, we will conclude with what is going on in other related
projects, such as the ones that provide a path to build the kernel
with GCC (`rustc_codegen_gcc` and GCC Rust).

[1] https://rust-for-linux.com

Cheers,
Miguel

