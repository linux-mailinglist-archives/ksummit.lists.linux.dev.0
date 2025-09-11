Return-Path: <ksummit+bounces-2356-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5CB53794
	for <lists@lfdr.de>; Thu, 11 Sep 2025 17:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3D21BC106D
	for <lists@lfdr.de>; Thu, 11 Sep 2025 15:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE2E34AB16;
	Thu, 11 Sep 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0oAQHZr"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D5320A1D
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603995; cv=none; b=pJoOeMKFhBk+MyEWOBN9v891QjG5+NNUaLef0JchgkNoMDdpgkhXhFtIbq7SdvXL8WHP3B3SN7NCrQvqKmBWUyoB8o3KkYgo6P1qQhfshHFmO1xsHXg0ni/gJJyFX6fAaPlYsxeCS4pEkV3m6/XUqAjeCd2ITgoklgLFelX14nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603995; c=relaxed/simple;
	bh=r99NtIpD59yFN7vvEhIkm2GjIpqUYqn4Kh78DPPnru4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3OQzgZ88jS3NXhFJ5fJ4Ws05DHJ2w5HL+zBWMMFSinMD4P6rz89yhzUt9owvG8QukqdZ7XZhRhFRnV36DSdWAsdN/C/Kx3tkgxfOEF4oLgapjwiGfofCoDI1KAwF+/9aISQ5JQyocNMKj+h6pYjBj/aMUJH8ZYXtxjBzkTRU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0oAQHZr; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336b908cbaaso7591031fa.1
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757603990; x=1758208790; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWzA1LdLH8P47t9lFzGcV6bY3rX2p/OttdrVRUE1sCk=;
        b=m0oAQHZrAbiyBLkNzhfmpBRMJ60MEEwCj6lVabvIV7Esbn8VXU8kd8lq1oHoFNtg83
         y+M84f4VDrxb8v8p8vTYxBjGF0oTpk1NV1T6S/U4u79IEWfRs8h/IbeBihMyVlldKeov
         yBHhAv/tX3KdFcZNYp0CYkW0nkcdQ7PqyV3wKM9WB+tX25u8H/wqog0gq2C+3+uF1xBh
         n+N/7YqFRhT3IcLhZ2Gm90Nq5fyimeIX4eAdVBduCMvTOwj0YHGNK2j7E/oQSPg2ppLE
         bhNTl6Echza03bHMO/b4EMT8Nk89iwYdN+6LtyEZyH9sGJciIRjQkOCh9M5kjbNeKa6i
         MVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603990; x=1758208790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWzA1LdLH8P47t9lFzGcV6bY3rX2p/OttdrVRUE1sCk=;
        b=rlXCVe2AoVya1Bh8XalCxI+drk1Oao0wMSv3/l3pNBC9ylvblEgEdq1z+0UqRnwz8G
         ksIEn9Mvu8p7tuVv3TZz0Oo6xu/nAsOmYbX3t8GD4+YKVtw4BFZlFFhIAnTVGGgUlO1M
         C+pqw795a0fhD86XXxRtphc02j1vpaj/+R08HRnCe0YqLtvZZtxLuVnddNAi9EJswOpq
         oE5eAhrpMGyeXGtgCILelWZEdcupJ8y37v9rl8j1SVvBVzPhD0U6tAXreSEdW7I4IYUZ
         Zw9uRsUCgNqDgVFAotTWzqUs1NdMvKAoMuoYCKqo3sS1nAuq3JJrBXPfIBUtCV99AwyG
         BF1A==
X-Gm-Message-State: AOJu0YxS9/bIBUCK0/RS+94t/1MxvcZ65/6ZWsNQ1TPTQmTS7B+vQeNQ
	Ftw+iOpagh1YLc5E/riPsxu5GxoPk1E+1xe8gplqwD6tQ1WAELsG0/tHRo/k0/1eWkpwng3vvgn
	U1d2c0j9Yf44SnHTYLDAzsLfhtcm9E96nSznH4rFtAEwQPpLPWP6QjpQ=
X-Gm-Gg: ASbGnctrV6C6B5VzXRAtcUCqDirEWyNAqGgcFohooeRrPDAlGIM8XunCfLvNlUCP6wE
	sFTfBdVCWKQGt6p6IlcrPAULl5YTZtimtYOF5kE1jyk2T1jJIcA/ECOkByudR1umspsyb+RpRzo
	BRTyodngufjuKLFLnoiryVBgqGYqYmfBWr39qUXyjLzZwNKhSRGhhfXMPSa+4+zseF44zaKNr63
	rCDolPy51aSrKjktg==
X-Google-Smtp-Source: AGHT+IERXyZyWTJ/VdBpgvFV1MfAoXsLzGIKIamuqZhPiJUX3Tphpfbd5uQehAKysM6W2TKuBnszxFMbP2nF6xtDrrw=
X-Received: by 2002:a2e:a9a7:0:b0:336:e42a:4ad8 with SMTP id
 38308e7fff4ca-33b608c58cemr62885811fa.44.1757603990008; Thu, 11 Sep 2025
 08:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
In-Reply-To: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Sep 2025 17:19:38 +0200
X-Gm-Features: Ac12FXylgp4D6y2LSd1VVkkjzFz7C2sBp-X746-M52H7yEmO0Rh1rzfazgUgUng
Message-ID: <CACRpkdaKKeD3zNXM3nazfVb2m9uwfywE_rnGy3hMxwX-Aw6stQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
To: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 9:37=E2=80=AFPM Sinyuk, Konstantin
<konstantin.sinyuk@intel.com> wrote:

> - Core driver design: proposed start under drivers/misc/ual/ for discover=
y,
>   topology, and resource management.

So this gives at hand that since this is no "ordinary" memory-mapped
driver, it needs its own bus and therefore intuitively its own subsystem?

What about drivers/accel/ual where other accelerators live?

Or if that is somehow inappropriate, just drivers/ual, don't be shy.

Yours,
Linus Walleij

