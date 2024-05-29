Return-Path: <ksummit+bounces-1213-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A71DE8D3ABF
	for <lists@lfdr.de>; Wed, 29 May 2024 17:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23976B23AC6
	for <lists@lfdr.de>; Wed, 29 May 2024 15:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065631802A3;
	Wed, 29 May 2024 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LC9xDGHE"
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B91B947
	for <ksummit@lists.linux.dev>; Wed, 29 May 2024 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996273; cv=none; b=ZVVTJhCqWTsB1fHUcCCQ3Ho91KTOL8eNrnPrmTSIWYDkOnO5HZKANMuxLzZw7O6bDq67/PFK5BsTbLnpWitCzmooqoQ0OiyRtCdFUOnKXkdYKvikbxq8lBqzJpWTfE6HvwePpWys0jXPtbyZPzYQWmB55enpGXCkoY0lfDEIZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996273; c=relaxed/simple;
	bh=eS9ZFeec5B5KKZCWeMXBRz7DrZuvinuxQTxCQOTN67c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hM9N8TsVR9Oa8XxwIb5Xeg3CiJhcs9tZCZNs27qXBfruwsPgCtVGMA+RZDEI38zhHBDWECsOTp8nGsACQua+EWIHSy5MF/mRATTCSLBkGd2GMif0FOToHNqHlhJ99P+hUwDI2gbwC7btaKmkXne1ePigH7lnYh3SCnXZMKN265Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LC9xDGHE; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df4eb08fd9eso2202717276.2
        for <ksummit@lists.linux.dev>; Wed, 29 May 2024 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716996271; x=1717601071; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eS9ZFeec5B5KKZCWeMXBRz7DrZuvinuxQTxCQOTN67c=;
        b=LC9xDGHEQP9pTj0/vMZDNVpWiFRnGT4Ttypqm7sZ/RoRaTFZd5KQfvTcq8CMEg2V1y
         iXZV9wKE1L4YdmDa4qkYHLGZqolMBerGyvVRoT9Lf2nVQw68yXlx22IEwzr88sy0nCZ3
         yh/7zMOyDIjhbFM7S8RVeMPeKVnH/NIqilvvtD8ZApEvTHyko50odLsPhyv8tPDaA4J/
         zwy2TVYp5Q3APnLFXg7uaiK/aYMPsX6nHWHuoi2LKqjBkOYQt53NuxVwhpxnni3OqkDG
         kcweyJpUPUEOinQYu78e3y+HDD/2X1u5J/6C0aLy1Y6h0i75YuTld2Gos2ysfyiLiSl3
         FV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996271; x=1717601071;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eS9ZFeec5B5KKZCWeMXBRz7DrZuvinuxQTxCQOTN67c=;
        b=OkOQvPcL0G0nE4Oo/Hipm/EhRgL/hmnGpV4aioxUsokXLRZ3j5cOYHgEdZ7jJee5uu
         zxtgLfNqFYJ3TbkmHEyuPcU7RZ5BwqlY9K5CT2hfgj4lqNJ8NHk5mUlnuOW0LK9fTAIO
         N8Pzr2ZHBotymmsX8XOQKLWg8z0mwFnFtWRPreMpEUsGfP3Wfk7RheUofYh8Aj5eh4Wn
         3brdFgMSpLN/2qvoJeIM6Vww3tymt97/ZQP8oYvc7nusPSSaIZuFOV1nUq1ggVYwRVZz
         K924Q9r77tJXu7nLCGIaD86/qDPAI/XXYdsK6a9mn6XX0wjpUzoaQ8wR/Ua9xhn2UUXc
         ojYQ==
X-Gm-Message-State: AOJu0YynjFapktMOPmYDijUMBLU2lVZ9WSmEEk//cKQrXRWphAabwmZJ
	Ph8oe7zcWCPHNMD53Xk4vQhwUKsFDoGETs0/rt5JF5l+Cz7o8CPccv94buDA3kGTEyotC2ywHWv
	8bbfEYt1UMzd2h4izTi3oByPh37TAR+I8nCPc062JNavH/Nqwf20=
X-Google-Smtp-Source: AGHT+IFA1NEpeesQIdpojb7moW/FeA0KupJucDHE4tTHe8dz+NrwCDbOUn0rIP+SLotcEDVR+oE3FTYPKD8MHzLFu38=
X-Received: by 2002:a25:abea:0:b0:dee:6ffb:b3c2 with SMTP id
 3f1490d57ef6-df7721ff6fdmr15058302276.54.1716996270717; Wed, 29 May 2024
 08:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 29 May 2024 17:24:19 +0200
Message-ID: <CACMJSeupU_j3bkj8muMrdrYvfnppYdZ4tPvZ+8OQ5A9BpTOWDw@mail.gmail.com>
Subject: [TECH TOPIC] Introducing the power sequencing subsystem
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi!

Here's my submission for the kernel summit track at LPC24.

Note: The power sequencing subsystem has not yet made its way into
mainline but as there's a lot of time left between when I'm writing
this and the LPC24 in Vienna I think it should at least make it into
next by the time of the presentation (there do not seem to be any
showstopper objections on the mailing list).

Thanks,
Bartosz

---

There is a class of physical devices that contain several discrete
modules in a single package but which are represented in the kernel as
separate entities. An example of such devices is the Qualcomm WCN/QCA
family of WLAN/Bluetooth adapter chipsets.

Typically the WLAN and Bluetooth modules will have their own
device-tree nodes - one under the PCI bridge (WLAN) and one under the
serial node (Bluetooth). The relevant drivers will bind to these
devices and consume assigned resources (which are usually already
reference counted).

The problem arises when the two modules packaged together have
interdependencies - for instance: a chipset may require a certain
delay between powering-up the Bluetooth and WLAN modules (an example:
Qualcomm QCA6490). In this case, reference counting alone is not
sufficient and we need more fine-grained serialization.

In order to support such devices, a new driver subsystem has been
proposed: the power sequencing framework[1]. It allows to abstract the
shared powering-up/-down operations for multiple devices into a
separate power sequence provider which knows about any possible
interactions between the modules it services. The new subsystem allows
for a flexible representation of the underlying hardware (e.g.: the
power management unit of the WCN/QCA chips is the device node to which
the power sequencer binds but on the device-tree it is represented as
a PMIC exposing a set of regulators consumed by WLAN and Bluetooth
nodes).

This talk will present the idea behind the new subsystem, the provider
and consumer programming interfaces for drivers and how we enabled
WiFi and Bluetooth support upstream for several Qualcomm platforms
with the first driver based on the pwrseq framework.

[1] https://lore.kernel.org/netdev/20240528-pwrseq-v8-0-d354d52b763c@linaro.org/

