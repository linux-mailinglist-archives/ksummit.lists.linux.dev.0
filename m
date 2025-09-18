Return-Path: <ksummit+bounces-2412-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD90B85D02
	for <lists@lfdr.de>; Thu, 18 Sep 2025 17:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 651B0177612
	for <lists@lfdr.de>; Thu, 18 Sep 2025 15:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25D531355D;
	Thu, 18 Sep 2025 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQ2Fnbn9"
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF901313D45
	for <ksummit@lists.linux.dev>; Thu, 18 Sep 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210676; cv=none; b=JCCnFtg7Jc9JifJuP6+1OP0e+dkuPkmg1c0sr7yacEi3LweecKEDzNNybcy0uaXS2uxsCP2BUjEICx5zggWgWxl30q0V9pVliYMCFXYNZTCjv8g+EyN7K6ee4pcob7j8+7wk3d9So5sxC+s8rMw8gpQWULHIeviw6G+9hJFY4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210676; c=relaxed/simple;
	bh=O6gIZvZ8Z/Z3FQOYoGIHOw4ojhAeR/dmivs2m+9mGj4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XjjVT2gPIRH5PJRqVnkwdOmjB5AU9CXwBj7/sgq8NDwZGL+CSDIlVQ8Jq8moA3DwZxMes5/UIiCuKFV2+QSujc+eHzgR/N+BXu6KerHpjm/PFSIYCmiVbm5QckvhzhSsP+emkoMIdgg5js1IVvwpDd+cYjeQx3LOcqeNjNyUS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQ2Fnbn9; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-62bbc95b4dfso680191d50.2
        for <ksummit@lists.linux.dev>; Thu, 18 Sep 2025 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758210672; x=1758815472; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O6gIZvZ8Z/Z3FQOYoGIHOw4ojhAeR/dmivs2m+9mGj4=;
        b=BQ2Fnbn9nOhEPbrBbyWAyiey5Opc/OpwXaiNh0HCvCUinPk4kKBxp/AVXLG04bzIOF
         bVmjWOCZKbQ1nM1Remf8EpFKCrOwUCeQzE5D4LYgYM5Bfs15++wKYPK9d3VAm9F6lGE4
         iAaVWBVMLohAthsguCOlKCKHjecnrBbfHcki7sP551SbipQMScFsMrM3LjvUwxk2yIwl
         CsJTGujgOY5dqnl9k1y/ezteC5g3AwZd+PjrerE+hEtyT/sv6Tg5lcajyRwBuNjLC8UP
         G+Rv+UBwB6EkqfMeUtRp48Z/+FeVOFATyOhwOCs9BcxFhS00gEtPcWmFAG7ROZzkkKIj
         Wq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210672; x=1758815472;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O6gIZvZ8Z/Z3FQOYoGIHOw4ojhAeR/dmivs2m+9mGj4=;
        b=Y8Y7Dv/kYRVoV82EusIkNR0EkjntJeuhJQ7IGwt6EXkyCIgbyRdNwAN/O45q3ZVjA5
         uifXSzXj8Hv0udOVEO+sjXZpWBZFpz7WV4gOzt6Gxt4mm1i3NPMceA3OZOnei/S6iKM3
         A2VzP+JaSd6LpqIv53OlkAPjAY/CXmJqQZQZt4A6UR/4E1GP0OuvhrALKkW0zsdhEjT+
         2Mq7vB069YjVzFvY3VSCnQeDIvcHnVaSNXQE5BOGuyS1rtNKqF5o9M4y//8NumxPSWor
         VSxn+Frz+WTgaNMi3cLzPg51fwTwh6hBGbqk89cNOAHMDzRU0lpRG/i2PzIbDjYZJYAv
         ViRQ==
X-Gm-Message-State: AOJu0Yx6695G/TQOlY5v8zzk1Ws/jL89Xebkr0aHzFKfzwBhWz2LW1yn
	NFXnvY3GInBXHM8NIArgD7I/8y/JYZGXG50MgVAbVNDTIjzVE45X0y9SHQRSNojUHq03gX/LHTK
	Zv8sj+exus6naWEC0M42AmYzK7HpEulpwz1xegLh5rUzurBWQeyil3wQ=
X-Gm-Gg: ASbGnctKaMrjYXT/3ijmFLWJl18/ODYJLPzuCAQoW4TvHvUQWF2J5y2sHc/WdgmAWjR
	rgcO7kuLEi/MG/oT1Y91Qu/qwqY7PnCE8IO3JcDkIzm8Kph8gtBvEfxSp9H7c07bVlEXe9sv03f
	QXXI0bvDL9cryymJRpjaXQ4VaQwT99dcLQ/ToTgzq3m9FQwf6KnUalZ7UoWAmGxgGUnZL1J2gPM
	+nllPYh1m9YW7Jzapm3rR918Ik=
X-Google-Smtp-Source: AGHT+IFjNE2Wb5q0q38C98tzHW58cZbIBYL5aQwqXXSqJ/h0zfuSit0Hc4UL2LNhsQ4yUEA+kcrz02bKb9fSXacVc0U=
X-Received: by 2002:a05:690e:244f:b0:5f3:319c:ff0a with SMTP id
 956f58d0204a3-6347f59e58emr3550d50.28.1758210672400; Thu, 18 Sep 2025
 08:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:50:36 +0200
X-Gm-Features: AS18NWAlUHgUie3K9gntf7RJTHMpmP_yKGMwvN9FFvNIXinZGU-l_oaYg3jJuV4
Message-ID: <CAPDyKFqBzm=-i3F7pbwT+NqnWKRnDis865qrzudq1C-6WbLUUw@mail.gmail.com>
Subject: [TECH TOPIC] Selecting a low-power state for a flash-based storage
 device (NVMe/UFS/eMMC/SD)
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Before reading, I wanted to let you know that I have submitted this
CFP to the power/thermal MC too, but I wanted to circle it here, due
to get a bit wider coverage.

On battery driven platforms, flash-based storage devices like
NVMe/UFS/eMMC/SD are being used in a combination with a carefully
designed support for platform-power-management. Yet, a flash-based
storage device typically contributes significantly to the
energy-budget for a platform. That means it's highly important to
manage them in an optimized way, otherwise we may waste a lot of
energy or in the worst case, if we get things wrong, we could even
damage the device.

In this regard, it's highly problematic that we are lacking a common
policy for how to deal with low-power states for these storage
devices. Especially since they are really sharing the same kind of
problems, while their respective subsystems treat them quite
differently. Some tend to pick the deepest possible low-power state,
while others prefer leaving the device fully powered-on, even during a
system-wide-sleep.

I want us to discuss these problems in more detail and in particular
let's see if we can find a way to start moving things into a more
common ground.

Kind regards
Ulf Hansson
MMC and PM subsystem maintainer

