Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD27DFC32
	for <lists@lfdr.de>; Thu,  2 Nov 2023 23:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37ED61C2101A
	for <lists@lfdr.de>; Thu,  2 Nov 2023 22:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C019B2230A;
	Thu,  2 Nov 2023 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnJaETNE"
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8881F94C
	for <ksummit@lists.linux.dev>; Thu,  2 Nov 2023 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a86b6391e9so17511827b3.0
        for <ksummit@lists.linux.dev>; Thu, 02 Nov 2023 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698963170; x=1699567970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laQewg25ReSqXKcxrUwdoOt2xD+guAvZG1KXn+PfpPM=;
        b=XnJaETNE8haG/iWoBKhoRo3FEesg0Smm3i8hqkqXgS93NSmq8dnngkYLToK0TUbWDl
         VPXEhriK2avZtaJOFFLlSrNXu3FtT9K0DEcXTbUKjpwq1RCm5h/M1LUDWM4QT02AFf5R
         LoKTN+zbGgaZKtVnK4o49p6cGQtYDNk9znG6HyTcnafDTmZe5YgZzQ8ZWFbO48g48nzP
         vVIeSpiNf7SiqAmeRBJHV/FtxONwpt4OGqHRDOzEBP35oYQp3wgyQFlrU2E85rMWjLbp
         jJlhtzvXIwyy3JGx6wkqA5MahN8GBQ34CZZ1UKDqJJZjY8YmZhfaVZIRJNFlEta//GU7
         W7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698963170; x=1699567970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laQewg25ReSqXKcxrUwdoOt2xD+guAvZG1KXn+PfpPM=;
        b=bBkbtmuUIGoNAccoyQkt67Qkz/B39VH5fN1XcisRjoi29uOVU9ZCZ9h2madYHCZlwN
         LO7bGx9Jrf3qCAZ71TEVISZ69oaGF0RuCMtM42CBJy3dnDTOWozzZYCMnKpv7fqJItYd
         mKCDrOdZt2AEFVZ2bykGSPqPD7RdGeDWXAVhekNQyARYY0cwz6FkbCdjt5V20R3Dnqel
         YlI4/TBQrQ5aOt19Lk3UiXFcBeYvWIX5QvnzoJ3Xn4iHsI+bm042Dvtm+/bFEgDtKkmZ
         NrLbC5DnJx7JkzEnmtYF5jOyaK1kPtE3UE6lR6zw26Wete8ZlrCk4h10FI+t7WqfkTKh
         5NZQ==
X-Gm-Message-State: AOJu0YyPkgbV/RDiM1naHNw5kxHTm6ByXT7mwHRWWStzVzFKpQxt+04i
	tL+6KVCsTquyyzf77M7J+o7fM3//H6ses0x22qeacw==
X-Google-Smtp-Source: AGHT+IEaJURBjvjqDDC076jc5EOQFjWedIFDyRqH24QdGPLjicOeGsJmxiWX4p2DhLtHJXUgLlzl3K2RsVDGp2MIzRc=
X-Received: by 2002:a81:480d:0:b0:5a7:aa16:6b05 with SMTP id
 v13-20020a81480d000000b005a7aa166b05mr1093071ywa.33.1698963169744; Thu, 02
 Nov 2023 15:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aef1eb0e-b708-4092-a15e-df0b158f0ad4@linuxfoundation.org>
In-Reply-To: <aef1eb0e-b708-4092-a15e-df0b158f0ad4@linuxfoundation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Nov 2023 23:12:38 +0100
Message-ID: <CACRpkdYEQ-gw=K73e6xGbi1waCe4wmBEMEvV7z665psM6He4HQ@mail.gmail.com>
Subject: Re: [ANN] Tips and Strategies for Reducing Stress and Burnout by
 Creating Psychological Safety
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: ksummit@lists.linux.dev, contact@linuxplumbersconf.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 11:19=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:

> The Linux Plumbers Conference Program Committee is pleased to announce
> that we have invited Dr. Gloria Chance to host a session at the Kernel
> Summit on November 15th 2023 to share tips and strategies for reducing
> stress and burnout. We hope this session will provide much needed help
> for maintainers and developers seeking such resources.

This is excellent news. Very nice.

Yours,
Linus Walleij

