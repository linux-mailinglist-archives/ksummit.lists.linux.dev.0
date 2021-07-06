Return-Path: <ksummit+bounces-242-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC343BD83E
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E71B71C0E5B
	for <lists@lfdr.de>; Tue,  6 Jul 2021 14:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2628D2F80;
	Tue,  6 Jul 2021 14:33:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC3168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 14:32:59 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id o10so20929928ils.6
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLma3WwmXFP6okyxv3FtG3ivlrxpA+GCqZOfQldBlig=;
        b=o6j1Byq8LuAB35pUNz42jB8pusccoJkdOy+Mjf1geD7smqln9nFE15aKGEn0BhVwgj
         w7NBF0Twe0qNs+W0aKtBPw93TCgJbyGR+4otRmH0TUM8iDxy97yHPl+r4bI3Wyz1hfIy
         Px1Eut+jGGE/kTbq24xkvDxelblgZ1twr7g3Q/eFeE4QU71yF5DkW4FcckAOOJDEaSBJ
         ramvspA5nVtR7/94WDo4tffHfPuLEq4A89SDev0CNEofRgDkyUSjTstS1x4TYB5iaFxl
         Djw5aZUFHqb230/lL5hJfNs5y1TFxjY6MVKQDpIKNvU33IYGQ+925yG2SsokQIHHywpR
         a2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLma3WwmXFP6okyxv3FtG3ivlrxpA+GCqZOfQldBlig=;
        b=cV1k4oI6RNKOdAEzjj6sRtBKzmleMWLYeY63Seygup0zDndAuWH8sry6lYkIm+Mx5x
         5w+9vPc9pNIYvnPVPNj4VgKTm9ctHSD7mXrEbi/1XOnIMMNUp6IHP521Wh4nw9PwdEvk
         teLN5wPd0gcb2FOIP4G+fGg4Ev8t/okehhK0TFUAijM+E5yX/Ok8Is4H75O3yindeecs
         Lh4o+AWnBF81oapCAP2vZyOCNlhHqsPoKAlcXx4qOFqE/AZJdDVDAZnuUgZoYMN6hSIj
         joKTZ4kluQPnVXZvsr7aAuLBr5ws8LO6wrVnBOxHsVcG50GWmkBWzj3F5aArjJZCioPl
         CGvA==
X-Gm-Message-State: AOAM531NEDyvvRL3/tAcSs7kQ6naGM9NWWURfyEz9RfxjNPe66D2cCEy
	B6By0vf6Acmjc+cN5E445L731Tnulx5IFBihqXc=
X-Google-Smtp-Source: ABdhPJwn3rsGvpejBoiFa+k3Ne9i4Mw3sB7dZIokVSk4dcREUKH5qaiSK/skEd2GzBI1u1camI/JT17drjAI12/xWfY=
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr14795585ilv.176.1625581977951;
 Tue, 06 Jul 2021 07:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
In-Reply-To: <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jul 2021 16:32:47 +0200
Message-ID: <CANiq72=qFaOnfdhRSeE6DyUOUTOeZbDR5Z4ZU9mMwHif78AexQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:30 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> But that does not mean we are not rewriting a second kernel either --

s/we are not/we are/

i.e. we are *not* rewriting a second kernel, but abstracting the C APIs.

Cheers,
Miguel

