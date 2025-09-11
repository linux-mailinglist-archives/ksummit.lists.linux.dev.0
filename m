Return-Path: <ksummit+bounces-2335-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A76B52FD2
	for <lists@lfdr.de>; Thu, 11 Sep 2025 13:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A8A64862A6
	for <lists@lfdr.de>; Thu, 11 Sep 2025 11:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A3322068F;
	Thu, 11 Sep 2025 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzE4a3lS"
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65992EA147
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589251; cv=none; b=j0fgPnmRMDJjcbOKYYzZEDHM8hEVIldN/bhpKz7RQoteS4EbUkt6I1BbnRmRTlCb/lwpq1AxozZl8pcFOecos2MUJHc2+4qLKuW2mThkqfAkjr4CeWVFnuGP9ivk6gzL7nxTxN3LcQKvv/7OKnUZ7rJkox84TNiWuSqELa0jKcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589251; c=relaxed/simple;
	bh=e9Q+QbHe50M7LdraNUh6ziyRpLSFDz0/nXIxldAyyFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCkcww/CiLxUZWhk5ft7ZkWIx83FE67zbCRs4NZa+wUF1kEriqydBuAN80nCo86oBeWlGyWTRvXYFdod5kZA2Ql1KwZZEnSjztjRBZjbiI1BrRbhoFGlx4hwlegmte7jEN+i3dWc2yCpHA9vSDDdL58hsjsYNgnbQPFbBckr6VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzE4a3lS; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ea0297e9cd4so320398276.3
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589249; x=1758194049; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9Q+QbHe50M7LdraNUh6ziyRpLSFDz0/nXIxldAyyFM=;
        b=JzE4a3lSFoN5Fg2ZlejI4fRVzjtf6AdbzuRHWKIWnJmYhffMFn0lP2kuEYYw7zgeSM
         LxPcWD60aKdMbWIU3Rkp0/icOYgMKuJWjPzXuFD0agTPXeR9cHLqhX1PDd46c8RDicpk
         B68FyAoo064gxdcaQxOoxVtnJUrITLys5hpZLQTiI5/SG+NjhlIdzgQPg7bag9+GnBVK
         iVdfU1xgmVsmsnA9rwPyjGYd8CzvovcFhy95GQcTXX5GUMHkRwLeqSxNoc7qoQ8talij
         LqkhLRyX9kgrhiuTSqXGgWFP9R8PlYDykkipXXcu2pXALC2HD5W1Eo4l+9oW4d2k8p9O
         od9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589249; x=1758194049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9Q+QbHe50M7LdraNUh6ziyRpLSFDz0/nXIxldAyyFM=;
        b=Wc0zoraYs7nj623iE3A7m0+izMmm7zvq5H0DRQEFpdXjLJb++so3jGOVsi6+zsOTW1
         Fd0X2PQslxwJLXbDKoGWmcOYXtsn6eb3s578PrLvQcyvCAcJqVCrYp/LNWHtT2Ie4/WU
         a2Nk/nYMLhWF/FZVw6v1BZZ2hUodDHZ/q93tYMDJkqNtXsfwQY3p29aG+fh3CfMrFmG1
         4VSZSzDKDBHCGhb6uIJ1wxawMgcxC1V8ZEm06j/MhWAzQwJARMqzb/zJhx/6E22bcMsj
         XL6e4yLD1ERH66+s66USzKxfeSjl9tIBcQ1AIb1rDd2o8WJFtCUzAUPQ7JPJU49yReWg
         G0Pw==
X-Gm-Message-State: AOJu0YyABqfOnnCfYFcZa7xrGgnO/5Yv9uAooCjL4Kjy0fsfBkV1pSfl
	VudZla/EWHtAGqeARZ61wBN9nmV+BdBMEiejzDtGISPvQ8+T2PSQtsJxJ3RQDLmAzsB3MaDKtDi
	hH90XCbLc188PHtpOYF4TxtAm0B429yEeG9hT
X-Gm-Gg: ASbGnct29YpdUjIcRxycVoVOnSqw1D2iJqKd+7holxCUiMFuV7F2FNo+jA17SYN8hRC
	urzG7qnCYUeZN559VHwJNSHvJCWFortV/Mtot7X9yWWIgZVPDHWen+QVTs52SSGpLUvXtkae7kn
	MDkyUstMI6damW0YJDFnZwCIXYMNomy1WRd0tNFzSjLK0N5fsSDQWSZcrNvRHIdVBz2aUG1Ouy/
	R8posDX
X-Google-Smtp-Source: AGHT+IG3iHrTDA+B3/wKYLssPJBG6WPXibDkFW5Do4xtgb8Mmc4toY/i6In/TTTfWStHEUlqTHKQHt7SOgUjCLdQnuU=
X-Received: by 2002:a05:6902:18cf:b0:e97:6e5:292 with SMTP id
 3f1490d57ef6-e9f6907c204mr17383314276.36.1757589248416; Thu, 11 Sep 2025
 04:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025091118-opposing-carrot-655b@gregkh> <a70edcba-0ef7-4d0d-bc00-0e8519a458e8@intel.com>
In-Reply-To: <a70edcba-0ef7-4d0d-bc00-0e8519a458e8@intel.com>
From: Konstantin Sinyuk <sinyuk@gmail.com>
Date: Thu, 11 Sep 2025 14:13:57 +0300
X-Gm-Features: AS18NWBglvTLPocL-fnQ_cE5D9coK7XW2sndmdRkh-cELTTHeT32ryUnQ41ipAA
Message-ID: <CAPpb9yk0v5DZ-ocqwQ=rdj30KKnO4HO1iFUOf62SjiBp_5jsDg@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
To: Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 11, 2025 at 08:12:45AM +0200, Greg Kroah-Hartman wrote:
> Do you have patches today for this new bus? Why not start submitting
> them already? Why wait till December?
>
> You are going to have to fix that footer up to be able to send
> anything to public lists :)

Hi Greg,

Good idea, we'll prioritize cleanup so an RFC skeleton can go out before
December for early feedback.

For the footer: understood. I'm on personal Gmail now and will switch to
proper SMTP config once it's set up.

Best Regards,
 Konstantin

